using Microsoft.VisualBasic;
using QX_Frame.App.Web;
using QX_Frame.Data.DTO;
using QX_Frame.Data.Entities;
using QX_Frame.Data.Options;
using QX_Frame.Data.QueryObject;
using QX_Frame.Data.Service;
using QX_Frame.Bantina;
using QX_Frame.Bantina.Extends;
using QX_Frame.Web.Filter;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using QX_Frame.Data.Configs;
using System.Reflection;
using System.Collections;

namespace QX_Frame.Web.Controllers
{
    public class ArticleController : WebControllerBase
    {

        // 古籍列表查看 1004
        [AuthenCheckAttribute(LimitCode = 1004)]
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
                if (!string.IsNullOrEmpty(title))
                {
                    bookQuery.NameFan = Strings.StrConv(title, VbStrConv.TraditionalChinese, 0);
                    bookQuery.NameJian = Strings.StrConv(title, VbStrConv.SimplifiedChinese, 0);
                }

                List<TB_Book> bookList = channel.QueryAll(bookQuery).Cast<List<TB_Book>>();

                BookCategoryViewModel bookCategoryViewModel = new BookCategoryViewModel();

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
                        //bookViewModel.ImageUris = GetImageUrisFromFolder(item.BookUid.ToString());
                        bookViewModel.Notice = item.Notice;
                        bookViewModel.CreateTime = item.CreateTime;

                        bookViewList.Add(bookViewModel);
                    }
                }

                bookCategoryViewModel.BookViewModelList = bookViewList;

                List<TB_Category> categoryList = channel.QueryAll(new TB_CategoryQueryObject()).Cast<List<TB_Category>>();
                bookCategoryViewModel.CategoryList = categoryList;

                return View(bookCategoryViewModel);
            }
        }

        // Detail
        [AuthenCheckAttribute(LimitCode = 0)]
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
                bookViewModel.ImageUris = GetImageUrisFromFolder(id.ToString());
                bookViewModel.Notice = book.Notice;
                bookViewModel.CreateTime = book.CreateTime;


                return View(bookViewModel);
            }
        }

        public ActionResult Read(Guid id)
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
                bookViewModel.ImageUris = GetImageUrisFromFolder(id.ToString());
                bookViewModel.Notice = book.Notice;
                bookViewModel.CreateTime = book.CreateTime;


                return View(bookViewModel);
            }
        }

        public string ReadEntity(Guid id)
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
                bookViewModel.ImageUris = GetImageUrisFromFolder(id.ToString());
                bookViewModel.Notice = book.Notice;
                bookViewModel.CreateTime = book.CreateTime;


                return bookViewModel.ToJson();

            }
        }


        // Add
        //[AuthenCheckAttribute(LimitCode = 1005)]
        public ActionResult Add()
        {
            using (var fact = Wcf<CategoryService>())
            {
                var channel = fact.CreateChannel();
                List<TB_Category> categoryList = channel.QueryAll(new TB_CategoryQueryObject()).Cast<List<TB_Category>>();
                List<TB_Category> resultList = DealCategory(categoryList, new List<TB_Category>(), 0);
                return View(resultList);
            }
        }

        //处理分类层级关系
        private List<TB_Category> DealCategory(List<TB_Category> categoryList, List<TB_Category> resultList, int startPid)
        {
            var searchList = categoryList.Where(t => t.PId == startPid).ToList();
            foreach (var item in searchList)
            {
                item.CategoryName = item.CategoryName.Replace("-","");
                string spaceString = "";
                for (int i = 0; i < item.Levels; i++)
                {
                    spaceString += "-";
                }
                if (startPid != 0)
                {
                    item.CategoryName = $"{spaceString}{item.CategoryName}";
                }
            }
            foreach (var item in searchList)
            {
                resultList.Add(item);
                if (categoryList.FirstOrDefault(t => t.PId != 0 && t.PId == item.CategoryId)!=null)
                {
                    return DealCategory(categoryList, resultList, item.CategoryId);
                }
            }
            return resultList;
        }

        [AuthenCheckAttribute(LimitCode = 1005)]
        public JsonResult AddDeal()
        {
            try
            {
                TB_Book book = new TB_Book();
                book.Title = Request["Title"];
                book.Title2 = Request["Title2"];
                book.Volume = Request["Volume"];
                book.Dynasty = Request["Dynasty"];
                book.CategoryId = Request["CategoryId"].ToInt();
                book.Functionary = Request["Functionary"];
                book.Publisher = Request["Publisher"];
                book.Version = Request["Version"];
                book.FromBF49 = Request["FromBF49"];
                book.FromAF49 = Request["FromAF49"];
                book.ImageUris = $"/Uploads/{book.BookUid.ToString()}";
                book.Notice = Request["Notice"];
                book.CreateTime = DateTime.Now;

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

        [AuthenCheckAttribute(LimitCode = 1006)]
        public ActionResult ImportArticle(HttpPostedFileBase fileInput)
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

                        List<TB_Category> categoryList = channel.QueryAll(new TB_CategoryQueryObject()).Cast<List<TB_Category>>();

                        DataTable table = Office_Helper_DG.ImportExceltoDt(filePath, 0, 0);

                        bool isSuccess = true;
                        Transaction_Helper_DG.Transaction(() =>
                        {
                            foreach (DataRow row in table.Rows)
                            {
                                TB_Book book = new TB_Book();
                                book.Title = row[0].ToString();
                                book.Title2 = row[1].ToString();
                                book.Volume = row[2].ToString();
                                book.Dynasty = row[3].ToString();
                                int categoryId = row[4].ToInt();
                                if (categoryList.Count(t => t.CategoryId == categoryId) > 0)
                                {
                                    book.CategoryId = categoryId;
                                }
                                else
                                {
                                    book.CategoryId = categoryList.FirstOrDefault().CategoryId;
                                }
                                book.Functionary = row[5].ToString();
                                book.Publisher = row[6].ToString();
                                book.Version = row[7].ToString();
                                book.FromBF49 = row[8].ToString();
                                book.FromAF49 = row[9].ToString();
                                book.ImageUris = $"/Uploads/{book.BookUid.ToString()}";
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
                            //return ERROR("添加失败!");
                            return new ContentResult { Content = "<script>alert('导入失败,请检查您的导入模板！')</script>" };
                        }
                    }
                }
            }
            catch (Exception)
            {
                return new ContentResult { Content = "<script>alert('导入失败，请检查您的导入模板！')</script>" };
            }
        }

        public static DataTable ToDataTable<T>(IEnumerable<T> collection)
        {
            var props = typeof(T).GetProperties();
            var dt = new DataTable();
            dt.Columns.AddRange(props.Select(p => new DataColumn(p.Name, p.PropertyType)).ToArray());
            if (collection.Count() > 0)
            {
                for (int i = 0; i < collection.Count(); i++)
                {
                    ArrayList tempList = new ArrayList();
                    foreach (PropertyInfo pi in props)
                    {
                        object obj = pi.GetValue(collection.ElementAt(i), null);
                        tempList.Add(obj);
                    }
                    object[] array = tempList.ToArray();
                    dt.LoadDataRow(array, true);
                }
            }
            return dt;
        }

        [AuthenCheckAttribute(LimitCode = 1007)]
        public ActionResult ExportArticle()
        {
            try
            {
                using (var fact = Wcf<BookService>())
                {
                    var channel = fact.CreateChannel();

                    TB_BookQueryObject bookQuery = new TB_BookQueryObject();

                    List<TB_Book> bookList = channel.QueryAll(bookQuery).Cast<List<TB_Book>>();

                    List<BookExportViewModel> bookExportViewList = new List<BookExportViewModel>();

                    foreach (var item in bookList)
                    {
                        BookExportViewModel bookExportViewModel = new BookExportViewModel();
                        TB_CmsStatus cmsStatus = channel.QuerySingle(new TB_CmsStatusQueryObject { QueryCondition = t => t.CmsUid == item.BookUid }).Cast<TB_CmsStatus>();
                        int bookStatus = cmsStatus.StatusId;

                        if (bookStatus == opt_CmsStatus.NORMAL.ToInt())
                        {
                            bookExportViewModel.标题 = item.Title;
                            bookExportViewModel.其他题名 = item.Title2;
                            bookExportViewModel.卷数 = item.Volume;
                            bookExportViewModel.朝代 = item.Dynasty;
                            bookExportViewModel.分类 = item.TB_Category?.CategoryName;
                            bookExportViewModel.责任人 = item.Functionary;
                            bookExportViewModel.出版者 = item.Publisher;
                            bookExportViewModel.版本 = item.Version;
                            bookExportViewModel.出处49年前 = item.FromBF49;
                            bookExportViewModel.出处49年后 = item.FromAF49;
                            bookExportViewModel.备注 = item.Notice;

                            bookExportViewList.Add(bookExportViewModel);
                        }
                    }

                    DataTable dt = ToDataTable(bookExportViewList);

                    string outPutZipFile = Path.Combine(Server.MapPath("~/Uploads/OutPut"), "AncientBooks.xlsx");

                    if (System.IO.File.Exists(outPutZipFile))
                    {
                        System.IO.File.Delete(outPutZipFile);
                    }

                    Office_Helper_DG.DataTableToExcel(outPutZipFile, "sheet0", dt);

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
            }
            catch (Exception ex)
            {
                return Content(ex.ToString());
            }
            return null;
        }

        // Edit
        [AuthenCheckAttribute(LimitCode = 1008)]
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
                //bookViewModel.ImageUris = GetImageUrisFromFolder(id.ToString());
                bookViewModel.Notice = book.Notice;

                BookCategoryViewModel bookCategoryViewModel = new BookCategoryViewModel();
                bookCategoryViewModel.BookViewModel = bookViewModel;
                List<TB_Category> categoryList = channel.QueryAll(new TB_CategoryQueryObject()).Cast<List<TB_Category>>();
                bookCategoryViewModel.CategoryList = categoryList;

                return View(bookCategoryViewModel);
            }
        }

        //Edit plus list
        [AuthenCheckAttribute(LimitCode = 1008)]
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
                    book.Volume = Request["Volume"];
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

        [AuthenCheckAttribute(LimitCode = 1009)]
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
                bookViewModel.ImageUris = GetImageUrisFromFolder(id.ToString());
                bookViewModel.Notice = book.Notice;

                return View(bookViewModel);
            }
        }

        [AuthenCheckAttribute(LimitCode = 1010)]
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
                bookViewModel.Notice = book.Notice;
                bookViewModel.CreateTime = book.CreateTime;

                bookViewModel.ImageUris = GetImageUrisFromFolder(id.ToString());
                bookViewModel.ImageNames = GetImageNamesFromFolder(id.ToString());

                return View(bookViewModel);
            }
        }

        private string[] GetImageNamesFromFolder(string folderName)
        {
            string folder = Path.Combine(Server.MapPath("~/Uploads/"), folderName);

            DirectoryInfo dir = new DirectoryInfo(folder);
            if (dir.Exists)
            {
                FileInfo[] files = dir.GetFiles();
                string[] imgNames = files.Select(t => t.Name).ToArray();
                return imgNames;
            }

            return new string[0];
        }

        private string[] GetImageUrisFromFolder(string folderName)
        {

            string[] imgNames = GetImageNamesFromFolder(folderName);
            string[] imgUris = new string[imgNames.Length];

            for (int i = 0; i < imgNames.Length; i++)
            {
                imgUris[i] = $"/Uploads/{folderName}/{imgNames[i]}";
            }
            return imgUris;
        }

        [AuthenCheckAttribute(LimitCode = 1010)]
        public ActionResult ImageDelete(Guid id)
        {
            try
            {
                string imgName = Request["imgName"];
                string file = Path.Combine(Server.MapPath($"~/Uploads/{id}"), imgName);
                if (System.IO.File.Exists(file))
                    System.IO.File.Delete(file);

                return OK("删除成功！");
            }
            catch (Exception)
            {
                return OK("删除失败！");
            }

        }

        [AuthenCheckAttribute(LimitCode = 1010)]
        public ActionResult EditImages(Guid id)
        {
            return OK("修改成功!");
            //try
            //{
            //    using (var fact = Wcf<BookService>())
            //    {
            //        var channel = fact.CreateChannel();
            //        TB_Book book = channel.QuerySingle(new TB_BookQueryObject { QueryCondition = t => t.BookUid == id }).Cast<TB_Book>();

            //string[] oldImagesArray = book.ImageUris.Split(',');

            //string imgUris = Request["ImageUris"];

            //book.ImageUris = imgUris.Replace("\\", "/");

            //string[] newImagesArray = book.ImageUris.Split(',');

            //string[] imagesArrayDelete = oldImagesArray.Except(newImagesArray).ToArray();

            //if (channel.Update(book))
            //{
            //    Task_Helper_DG.TaskRun(() =>
            //    {
            //        foreach (var item in imagesArrayDelete)
            //        {
            //            if (item.Length > 3)
            //            {
            //                string serverName = Server.MapPath("~/");
            //                string fileName = item.Substring(1, item.Length - 1);
            //                fileName = serverName + fileName;
            //                fileName = Path.GetFullPath(fileName);
            //                if (System.IO.File.Exists(fileName))
            //                    System.IO.File.Delete(fileName);
            //            }
            //        }
            //    });
            //    return OK("修改成功!");
            //}
            //else
            //{
            //    return ERROR("修改失败!");
            //}


            //2017-10-19 14:50:04 update
            //        string imgUris = Request["ImageUris"];

            //        book.ImageUris = Path.Combine("/Uploads/", imgUris);


            //        if (channel.Update(book))
            //        {
            //            return OK("修改成功!");
            //        }
            //        else
            //        {
            //            return ERROR("修改失败!");
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{
            //    return ERROR(ex.ToString());
            //}
        }

        /// <summary>
        /// DownLoad Images
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AuthenCheckAttribute(LimitCode = 1011)]
        public JsonResult DownLoadImages(Guid id, string title)
        {
            string dirInput = Path.Combine(Server.MapPath("~/Uploads"), id.ToString());
            string outPutZipFile = Path.Combine(Server.MapPath("~/Uploads/OutPut"), title + ".zip");
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
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(title + ".zip", Encoding.UTF8));
            Response.AddHeader("Content-Length", fileSize.ToString());

            Response.BinaryWrite(fileBuffer);
            Response.End();
            Response.Close();

            return OK("download success");
        }

        public JsonResult DownLoadImages_front(Guid id, string title)
        {
            string dirInput = Path.Combine(Server.MapPath("~/Uploads"), id.ToString());
            string outPutZipFile = Path.Combine(Server.MapPath("~/Uploads/OutPut"), title + ".zip");
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
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(title + ".zip", Encoding.UTF8));
            Response.AddHeader("Content-Length", fileSize.ToString());

            Response.BinaryWrite(fileBuffer);
            Response.End();
            Response.Close();

            return OK("download success");
        }

        // Delete
        [AuthenCheckAttribute(LimitCode = 1012)]
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

                BookCategoryViewModel bookCategoryViewModel = new BookCategoryViewModel();

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
                        //bookViewModel.ImageUris = GetImageUrisFromFolder(item.BookUid.ToString());
                        bookViewModel.Notice = item.Notice;
                        bookViewModel.CreateTime = item.CreateTime;

                        bookViewList.Add(bookViewModel);
                    }
                }
                bookCategoryViewModel.BookViewModelList = bookViewList;

                List<TB_Category> categoryList = channel.QueryAll(new TB_CategoryQueryObject()).Cast<List<TB_Category>>();
                bookCategoryViewModel.CategoryList = categoryList;

                return View(bookCategoryViewModel);

                return View(bookViewList);
            }
        }

        [AuthenCheckAttribute(LimitCode = 1012)]
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

        [AuthenCheckAttribute(LimitCode = 1013)]
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