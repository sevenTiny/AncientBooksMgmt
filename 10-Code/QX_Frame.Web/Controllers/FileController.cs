using QX_Frame.App.Web;
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
    public class FileController : WebControllerBase
    {
        // ImageList
        public ActionResult ImageList()
        {
            return null;
        }

        // ImageUpload
        public ActionResult ImageUpload()
        {
            return null;
        }
        [HttpPost]
        //uploadify是逐次触发Uploadify的，所以每次只有一个文件，不需要foreach，
        public JsonResult Uploadify(string id ,HttpPostedFileBase uploadfile)
        {
            //这里id拿到的值不对
            string folderName = id;
            if (uploadfile != null && uploadfile.ContentLength > 0)
            {
                var fileName = Path.GetFileName(uploadfile.FileName);
                var path = Path.Combine(Server.MapPath("~/Uploads/"),folderName, fileName);
                if (System.IO.File.Exists(path))
                    System.IO.File.Delete(path);
                uploadfile.SaveAs(path);
                return OK(path);
            }
            return ERROR("upload faild!");
        }

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