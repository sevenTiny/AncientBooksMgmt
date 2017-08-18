using QX_Frame.App.Web;
using QX_Frame.Data.DTO;
using QX_Frame.Data.Entities;
using QX_Frame.Data.Options;
using QX_Frame.Data.QueryObject;
using QX_Frame.Data.Service;
using QX_Frame.Helper_DG;
using QX_Frame.Helper_DG.Extends;
using QX_Frame.Web.Filter;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace QX_Frame.Web.Controllers
{
    public class ArticleController : WebControllerBase
    {
        
        // 古籍列表查看 1004
        [AuthenCheckAttribute(LimitCode =1004)]
        public ActionResult List()
        {
            int categoryId = Request["categoryId"].ToInt();
            string title = Request["title"];

            using (var fact = Wcf<BookService>())
            {
                var channel = fact.CreateChannel();

                TB_BookQueryObject bookQuery = new TB_BookQueryObject();

                bookQuery.CategoryId = categoryId;
                bookQuery.Title = title;

                List<TB_Book> bookList = channel.QueryAll(bookQuery).Cast<List<TB_Book>>();

                List<BookViewModel> bookViewList = new List<BookViewModel>();

                foreach (var item in bookList)
                {
                    BookViewModel bookViewModel = new BookViewModel();
                    TB_CmsStatus cmsStatus = channel.QuerySingle(new TB_CmsStatusQueryObject { QueryCondition = t => t.CmsUid == item.BookUid }).Cast<TB_CmsStatus>();
                    int bookStatus = cmsStatus.StatusId;

                    if (bookStatus == opt_CmsStatus.NORMAL.ToInt())
                    {
                        bookViewModel.BookUid = item.BookUid;
                        bookViewModel.Title = item.Title;
                        bookViewModel.Title2 = item.Title2;
                        bookViewModel.Volume = item.Volume;
                        bookViewModel.Dynasty = item.Dynasty;
                        bookViewModel.CategoryId = item.CategoryId;
                        bookViewModel.CategoryName = item.TB_Category?.CategoryName;
                        bookViewModel.Functionary = item.Functionary;
                        bookViewModel.Publisher = item.Publisher;
                        bookViewModel.Version = item.Version;
                        bookViewModel.FromBF49 = item.FromBF49;
                        bookViewModel.FromAF49 = item.FromAF49;
                        bookViewModel.ImageUris = item.ImageUris;
                        bookViewModel.Notice = item.Notice;

                        bookViewList.Add(bookViewModel);
                    }
                }

                return View(bookViewList);
            }
        }

        // Detail
        public ActionResult Detail(Guid id)
        {
            using (var fact = Wcf<BookService>())
            {
                var channel = fact.CreateChannel();
                TB_Book book = channel.QuerySingle(new TB_BookQueryObject { QueryCondition = t => t.BookUid == id }).Cast<TB_Book>();

                BookViewModel bookViewModel = new BookViewModel();

                bookViewModel.BookUid = book.BookUid;
                bookViewModel.Title = book.Title;
                bookViewModel.Title2 = book.Title2;
                bookViewModel.Volume = book.Volume;
                bookViewModel.Dynasty = book.Dynasty;
                bookViewModel.CategoryId = book.CategoryId;
                bookViewModel.CategoryName = book.TB_Category.CategoryName;
                bookViewModel.Functionary = book.Functionary;
                bookViewModel.Publisher = book.Publisher;
                bookViewModel.Version = book.Version;
                bookViewModel.FromBF49 = book.FromBF49;
                bookViewModel.FromAF49 = book.FromAF49;
                bookViewModel.ImageUris = book.ImageUris;
                bookViewModel.Notice = book.Notice;

                return View(bookViewModel);
            }
        }

        // Add
        public ActionResult Add() => View();

        public JsonResult AddDeal()
        {
            try
            {
                TB_Book book = new TB_Book();
                book.Title = Request["Title"];
                book.Title2 = Request["Title2"];
                book.Volume = Request["Volume"].ToInt();
                book.Dynasty = Request["Dynasty"];
                book.CategoryId = Request["CategoryId"].ToInt();
                book.Functionary = Request["Functionary"];
                book.Publisher = Request["Publisher"];
                book.Version = Request["Version"];
                book.FromBF49 = Request["FromBF49"];
                book.FromAF49 = Request["FromAF49"];
                //book.ImageUris = Request["ImageUris"];
                book.Notice = Request["Notice"];

                bool isSuccess = true;
                Transaction_Helper_DG.Transaction(() =>
                {
                    using (var fact = Wcf<BookService>())
                    {
                        var channel = fact.CreateChannel();
                        isSuccess = isSuccess && channel.Add(book);
                    }

                    using (var fact = Wcf<CmsStatusService>())
                    {
                        var channel = fact.CreateChannel();
                        isSuccess = isSuccess && channel.Add(new TB_CmsStatus { CmsUid = book.BookUid, StatusId = opt_CmsStatus.NORMAL.ToInt() });
                    }
                });
                if (isSuccess)
                {
                    return OK("添加成功!");
                }
                else
                {
                    return ERROR("添加失败!");
                }
            }
            catch (Exception ex)
            {
                return ERROR(ex.ToString());
            }
        }

        public JsonResult ImportArticle(HttpPostedFileBase fileInput)
        {
            try
            {
                string dir = Server.MapPath("~/Uploads");

                if (!System.IO.Directory.Exists(dir))
                {
                    System.IO.Directory.CreateDirectory(dir);
                }
                string filePath = Path.Combine(dir, "importExcel.xlsx");
                fileInput.SaveAs(filePath);

                using (var fact = Wcf<BookService>())
                {
                    using (var fact_cms = Wcf<CmsStatusService>())
                    {
                        var channel = fact.CreateChannel();
                        var channel_cms = fact_cms.CreateChannel();

                        DataTable table = Office_Helper_DG.ImportExceltoDt(filePath, 0, 0);

                        bool isSuccess = true;
                        Transaction_Helper_DG.Transaction(() =>
                        {
                            foreach (DataRow row in table.Rows)
                            {
                                TB_Book book = new TB_Book();
                                book.Title = row[0].ToString();
                                book.Title2 = row[1].ToString();
                                book.Volume = row[2].ToInt();
                                book.Dynasty = row[3].ToString();
                                book.CategoryId = row[4].ToInt();
                                book.Functionary = row[5].ToString();
                                book.Publisher = row[6].ToString();
                                book.Version = row[7].ToString();
                                book.FromBF49 = row[8].ToString();
                                book.FromAF49 = row[9].ToString();
                                //book.ImageUris = Request["ImageUris"];
                                book.Notice = row[10].ToString();
                                isSuccess = isSuccess && channel.Add(book);

                                isSuccess = isSuccess && channel_cms.Add(new TB_CmsStatus { CmsUid = book.BookUid, StatusId = opt_CmsStatus.NORMAL.ToInt() });
                            }
                        });

                        if (isSuccess)
                        {
                            return OK("添加成功!");
                        }
                        else
                        {
                            return ERROR("添加失败!");
                        }
                    }
                }
            }
            catch (Exception)
            {
                return ERROR("导入失败！");
            }
        }

        public ActionResult ExportArticle()
        {
            using (var fact = Wcf<BookService>())
            {
                var channel = fact.CreateChannel();

                TB_BookQueryObject bookQuery = new TB_BookQueryObject();
                bookQuery.SqlExecuteType = App.Base.Options.ExecuteType.ExecuteDataTable;
                bookQuery.SqlStatementTextOrSpName = "select * from TB_Book";

                DataTable dt = channel.QuerySql(bookQuery).Cast<DataTable>();

                string outPutZipFile = Path.Combine(Server.MapPath("~/Uploads/OutPut"), "AncientBooks.xlsx");

                if (System.IO.File.Exists(outPutZipFile))
                {
                    System.IO.File.Delete(outPutZipFile);
                }

                Office_Helper_DG.DataTableToExcel(outPutZipFile, "sheet0",dt );

                FileStream fileStream = new FileStream(outPutZipFile, FileMode.Open);
                long fileSize = fileStream.Length;
                byte[] fileBuffer = new byte[fileSize];
                fileStream.Read(fileBuffer, 0, (int)fileSize);
                //如果不写fileStream.Close()语句，用户在下载过程中选择取消，将不能再次下载
                fileStream.Close();

                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode("AncientBooks.xlsx", Encoding.UTF8));
                Response.AddHeader("Content-Length", fileSize.ToString());

                Response.BinaryWrite(fileBuffer);
                Response.End();
                Response.Close();
            }
            return null;
        }

        // Edit
        public ActionResult Edit(Guid id)
        {
            using (var fact = Wcf<BookService>())
            {
                var channel = fact.CreateChannel();
                TB_Book book = channel.QuerySingle(new TB_BookQueryObject { QueryCondition = t => t.BookUid == id }).Cast<TB_Book>();

                BookViewModel bookViewModel = new BookViewModel();

                bookViewModel.BookUid = book.BookUid;
                bookViewModel.Title = book.Title;
                bookViewModel.Title2 = book.Title2;
                bookViewModel.Volume = book.Volume;
                bookViewModel.Dynasty = book.Dynasty;
                bookViewModel.CategoryId = book.CategoryId;
                bookViewModel.CategoryName = book.TB_Category.CategoryName;
                bookViewModel.Functionary = book.Functionary;
                bookViewModel.Publisher = book.Publisher;
                bookViewModel.Version = book.Version;
                bookViewModel.FromBF49 = book.FromBF49;
                bookViewModel.FromAF49 = book.FromAF49;
                bookViewModel.ImageUris = book.ImageUris;
                bookViewModel.Notice = book.Notice;

                return View(bookViewModel);
            }
        }

        //Edit plus list
        public ActionResult EditSave(Guid id)
        {
            try
            {
                using (var fact = Wcf<BookService>())
                {
                    var channel = fact.CreateChannel();
                    TB_Book book = channel.QuerySingle(new TB_BookQueryObject { QueryCondition = t => t.BookUid == id }).Cast<TB_Book>();
                    book.Title = Request["Title"];
                    book.Title2 = Request["Title2"];
                    book.Volume = Request["Volume"].ToInt();
                    book.Dynasty = Request["Dynasty"];
                    book.CategoryId = Request["CategoryId"].ToInt();
                    book.Functionary = Request["Functionary"];
                    book.Publisher = Request["Publisher"];
                    book.Version = Request["Version"];
                    book.FromBF49 = Request["FromBF49"];
                    book.FromAF49 = Request["FromAF49"];
                    //book.ImageUris = Request["ImageUris"];
                    book.Notice = Request["Notice"];

                    if (channel.Update(book))
                    {
                        return OK("修改成功!");
                    }
                    else
                    {
                        return ERROR("修改失败!");
                    }
                }
            }
            catch (Exception ex)
            {
                return ERROR(ex.ToString());
            }
        }

        public ActionResult UploadImages(Guid id)
        {
            using (var fact = Wcf<BookService>())
            {
                var channel = fact.CreateChannel();
                TB_Book book = channel.QuerySingle(new TB_BookQueryObject { QueryCondition = t => t.BookUid == id }).Cast<TB_Book>();

                BookViewModel bookViewModel = new BookViewModel();

                bookViewModel.BookUid = book.BookUid;
                bookViewModel.Title = book.Title;
                bookViewModel.Title2 = book.Title2;
                bookViewModel.Volume = book.Volume;
                bookViewModel.Dynasty = book.Dynasty;
                bookViewModel.CategoryId = book.CategoryId;
                bookViewModel.CategoryName = book.TB_Category.CategoryName;
                bookViewModel.Functionary = book.Functionary;
                bookViewModel.Publisher = book.Publisher;
                bookViewModel.Version = book.Version;
                bookViewModel.FromBF49 = book.FromBF49;
                bookViewModel.FromAF49 = book.FromAF49;
                bookViewModel.ImageUris = book.ImageUris;
                bookViewModel.Notice = book.Notice;

                return View(bookViewModel);
            }
        }

        public ActionResult ImagesMgmt(Guid id)
        {
            using (var fact = Wcf<BookService>())
            {
                var channel = fact.CreateChannel();
                TB_Book book = channel.QuerySingle(new TB_BookQueryObject { QueryCondition = t => t.BookUid == id }).Cast<TB_Book>();

                BookViewModel bookViewModel = new BookViewModel();

                bookViewModel.BookUid = book.BookUid;
                bookViewModel.Title = book.Title;
                bookViewModel.Title2 = book.Title2;
                bookViewModel.Volume = book.Volume;
                bookViewModel.Dynasty = book.Dynasty;
                bookViewModel.CategoryId = book.CategoryId;
                bookViewModel.CategoryName = book.TB_Category.CategoryName;
                bookViewModel.Functionary = book.Functionary;
                bookViewModel.Publisher = book.Publisher;
                bookViewModel.Version = book.Version;
                bookViewModel.FromBF49 = book.FromBF49;
                bookViewModel.FromAF49 = book.FromAF49;
                bookViewModel.ImageUris = book.ImageUris;
                bookViewModel.Notice = book.Notice;

                return View(bookViewModel);
            }
        }

        public ActionResult EditImages(Guid id)
        {
            try
            {
                using (var fact = Wcf<BookService>())
                {
                    var channel = fact.CreateChannel();
                    TB_Book book = channel.QuerySingle(new TB_BookQueryObject { QueryCondition = t => t.BookUid == id }).Cast<TB_Book>();

                    string[] oldImagesArray = book.ImageUris.Split(',');

                    string imgUris = Request["ImageUris"];

                    book.ImageUris = imgUris.Replace("\\", "/");

                    string[] newImagesArray = book.ImageUris.Split(',');

                    string[] imagesArrayDelete = oldImagesArray.Except(newImagesArray).ToArray();

                    if (channel.Update(book))
                    {
                        Task_Helper_DG.TaskRun(() =>
                        {
                            foreach (var item in imagesArrayDelete)
                            {
                                if (item.Length > 3)
                                {
                                    string serverName = Server.MapPath("~/");
                                    string fileName = item.Substring(1, item.Length - 1);
                                    fileName = serverName + fileName;
                                    fileName = Path.GetFullPath(fileName);
                                    if (System.IO.File.Exists(fileName))
                                        System.IO.File.Delete(fileName);
                                }
                            }
                        });
                        return OK("修改成功!");
                    }
                    else
                    {
                        return ERROR("修改失败!");
                    }
                }
            }
            catch (Exception ex)
            {
                return ERROR(ex.ToString());
            }
        }

        /// <summary>
        /// DownLoad Images
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public JsonResult DownLoadImages(Guid id,string title)
        {
            string dirInput =Path.Combine(Server.MapPath("~/Uploads"),id.ToString());
            string outPutZipFile = Path.Combine(Server.MapPath("~/Uploads/OutPut"), title+".zip");
            string OutPutZipDir = Server.MapPath("~/Uploads/OutPut");

            if (!Directory.Exists(dirInput))
            {
                Directory.CreateDirectory(dirInput);
            }

            IO_Helper_DG.ZipDir(dirInput, outPutZipFile);

            Task_Helper_DG.TaskRun(() =>
            {
                foreach (var item in Directory.GetFiles(OutPutZipDir))
                {
                    if (!item.Equals(outPutZipFile))
                    {
                        System.IO.File.Delete(item);
                    }
                } 
            });

            FileStream fileStream = new FileStream(outPutZipFile, FileMode.Open);
            long fileSize = fileStream.Length;
            byte[] fileBuffer = new byte[fileSize];
            fileStream.Read(fileBuffer, 0, (int)fileSize);
            //如果不写fileStream.Close()语句，用户在下载过程中选择取消，将不能再次下载
            fileStream.Close();

            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(title+".zip", Encoding.UTF8));
            Response.AddHeader("Content-Length", fileSize.ToString());
            
            Response.BinaryWrite(fileBuffer);
            Response.End();
            Response.Close();

            return OK("download success");
        }

        // Delete
        public ActionResult Delete()
        {
            int categoryId = Request["categoryId"].ToInt();
            string title = Request["title"];

            using (var fact = Wcf<BookService>())
            {
                var channel = fact.CreateChannel();

                TB_BookQueryObject bookQuery = new TB_BookQueryObject();

                bookQuery.CategoryId = categoryId;
                bookQuery.Title = title;

                List<TB_Book> bookList = channel.QueryAll(bookQuery).Cast<List<TB_Book>>();

                List<BookViewModel> bookViewList = new List<BookViewModel>();

                foreach (var item in bookList)
                {
                    BookViewModel bookViewModel = new BookViewModel();
                    int bookStatus = channel.QuerySingle(new TB_CmsStatusQueryObject { QueryCondition = t => t.CmsUid == item.BookUid }).Cast<TB_CmsStatus>().StatusId;

                    if (bookStatus == opt_CmsStatus.DELETE.ToInt())
                    {
                        bookViewModel.BookUid = item.BookUid;
                        bookViewModel.Title = item.Title;
                        bookViewModel.Title2 = item.Title2;
                        bookViewModel.Volume = item.Volume;
                        bookViewModel.Dynasty = item.Dynasty;
                        bookViewModel.CategoryId = item.CategoryId;
                        bookViewModel.CategoryName = item.TB_Category.CategoryName;
                        bookViewModel.Functionary = item.Functionary;
                        bookViewModel.Publisher = item.Publisher;
                        bookViewModel.Version = item.Version;
                        bookViewModel.FromBF49 = item.FromBF49;
                        bookViewModel.FromAF49 = item.FromAF49;
                        bookViewModel.ImageUris = item.ImageUris;
                        bookViewModel.Notice = item.Notice;

                        bookViewList.Add(bookViewModel);
                    }
                }

                return View(bookViewList);
            }
        }

        public ActionResult DeleteDeal(Guid id)
        {
            using (var fact = Wcf<CmsStatusService>())
            {
                var channel = fact.CreateChannel();
                TB_CmsStatus status = channel.QuerySingle(new TB_CmsStatusQueryObject { QueryCondition = t => t.CmsUid == id }).Cast<TB_CmsStatus>();
                status.StatusId = opt_CmsStatus.DELETE.ToInt();
                if (channel.Update(status))
                {
                    return OK("删除成功！");
                }
            }
            return ERROR("删除失败！");
        }

        public ActionResult ReDelete(Guid id)
        {
            using (var fact = Wcf<CmsStatusService>())
            {
                var channel = fact.CreateChannel();
                TB_CmsStatus status = channel.QuerySingle(new TB_CmsStatusQueryObject { QueryCondition = t => t.CmsUid == id }).Cast<TB_CmsStatus>();
                status.StatusId = opt_CmsStatus.NORMAL.ToInt();
                if (channel.Update(status))
                {
                    return OK("修改成功！");
                }
            }
            return ERROR("恢复失败！");
        }

    }
}