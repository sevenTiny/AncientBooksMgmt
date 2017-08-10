using QX_Frame.Helper_DG;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QX_Frame.Web.Controllers
{
    public class FileController : Controller
    {
        // ImageList
        public ActionResult ImageList() => View();
        
        // ImageUpload
        public ActionResult ImageUpload() => View();

        /// <summary>
        /// Return Validate Code Iamge
        /// </summary>
        /// <returns></returns>
        public FileContentResult ValidateCodeImage()
        {
            string code = String_Helper_DG.GetRandomString(4); //Code Length is four(4)
            Cache_Helper_DG.Cache_Add("ValidateCode", code); //storage SecurityCode to cache
            return File(Graphic_Helper_DG.CreateValidateGraphic(code), "image/Jpeg");
        }
    }
}