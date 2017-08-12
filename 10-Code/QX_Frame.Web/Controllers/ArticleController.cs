﻿using QX_Frame.App.Web;
using QX_Frame.Data.DTO;
using QX_Frame.Data.Entities;
using QX_Frame.Data.Options;
using QX_Frame.Data.QueryObject;
using QX_Frame.Data.Service;
using QX_Frame.Helper_DG;
using QX_Frame.Helper_DG.Extends;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QX_Frame.Web.Controllers
{
    public class ArticleController : WebControllerBase
    {
        // List
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
                    int bookStatus = channel.QuerySingle(new TB_CmsStatusQueryObject { QueryCondition = t => t.CmsUid == item.BookUid }).Cast<TB_CmsStatus>().StatusId;

                    if (bookStatus == opt_CmsStatus.NORMAL.ToInt())
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
                book.ImageUris = Request["ImageUris"];
                book.Notice = Request["Notice"];


                bool isAddSuccess = true;
                Helper_DG.Transaction_Helper_DG.Transaction(() =>
                {
                    using (var fact = Wcf<BookService>())
                    {
                        var channel = fact.CreateChannel();
                        isAddSuccess = isAddSuccess && channel.Add(book);
                    }
                    using (var fact= Wcf<CmsStatusService>())
                    {
                        var channel = fact.CreateChannel();
                        isAddSuccess = isAddSuccess && channel.Add(new TB_CmsStatus { CmsUid = book.BookUid, StatusId = opt_CmsStatus.NORMAL.ToInt() });
                    }
                });

                if (isAddSuccess)
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