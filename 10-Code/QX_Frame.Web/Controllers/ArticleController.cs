using QX_Frame.App.Web;
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
        public ActionResult List() { return View(); }

        // Detail
        public ActionResult Detail() { return View(); }

        // Add
        public ActionResult Add()=> View();

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


                using (var fact = Wcf<BookService>())
                {
                    var channel = fact.CreateChannel();
                    if (channel.Add(book))
                    {
                        return OK("添加成功!");
                    }
                    else
                    {
                        return ERROR("添加失败!");
                    }
                }
            }
            catch (Exception ex)
            {
                return ERROR(ex.ToString());
            }
        }

        // Edit
        public ActionResult Edit() { return View(); }

        //Edit plus list
        public ActionResult Edit2() { return View(); }

        // Delete
        public ActionResult Delete() { return View(); }

    }
}