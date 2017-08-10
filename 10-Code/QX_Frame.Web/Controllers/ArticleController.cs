using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QX_Frame.Web.Controllers
{
    public class ArticleController : Controller
    {
        // List
        public ActionResult List() => View();

        // Detail
        public ActionResult Detail() => View();

        // Add
        public ActionResult Add() => View();

        // Edit
        public ActionResult Edit() => View();

        //Edit plus list
        public ActionResult Edit2() => View();

        // Delete
        public ActionResult Delete() => View();

    }
}