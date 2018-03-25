using QX_Frame.App.Web;
using QX_Frame.Data.Entities;
using QX_Frame.Data.QueryObject;
using QX_Frame.Data.Service;
using QX_Frame.Web.Filter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace QX_Frame.Web.Controllers
{
    public class CategoryController : WebControllerBase
    {
        // GET: Category
        public ActionResult Index()
        {
            return View();
        }

        [AuthenCheckAttribute(LimitCode = 1017)]
        public ActionResult List()
        {
            return View(GetAllCategory());
        }

        //获取全部分类
        public static List<TB_Category> GetAllCategory()
        {
            using (var fact = Wcf<CategoryService>())
            {
                var channel = fact.CreateChannel();
                List<TB_Category> categoryList = channel.QueryAll(new TB_CategoryQueryObject()).Cast<List<TB_Category>>();
                List<TB_Category> resultList = DealCategory(categoryList, new List<TB_Category>(), 0);
                return resultList;
            }
        }

        //处理分类层级关系
        private static List<TB_Category> DealCategory(List<TB_Category> categoryList, List<TB_Category> resultList, int startPid)
        {
            var searchList = categoryList.Where(t => t.PId == startPid).ToList();
            foreach (var item in searchList)
            {
                item.CategoryName = item.CategoryName.Replace("-", "");
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
                if (categoryList.FirstOrDefault(t => t.PId != 0 && t.PId == item.CategoryId) == null)
                {
                    continue;
                }
                DealCategory(categoryList, resultList, item.CategoryId);
            }
            return resultList;
        }


        [AuthenCheckAttribute(LimitCode = 1018)]
        public ActionResult AddDeal()
        {
            using (var fact = Wcf<CategoryService>())
            {
                var channel = fact.CreateChannel();
                TB_Category category = new TB_Category();
                category.CategoryName = Request["categoryName"].ToString();
                category.PId = Convert.ToInt32(Request["categoryParentId"]);
                category.Levels = Convert.ToInt32(Request["level"]) + 1;

                if (string.IsNullOrEmpty(category.CategoryName))
                {
                    return ERROR("分类名不能为空!");
                }

                if (!channel.Add(category))
                {
                    return ERROR("add faild !");
                }
            }
            return OK("add succeed !");
        }

        [AuthenCheckAttribute(LimitCode = 1019)]
        public ActionResult EditDeal(int id)
        {
            using (var fact = Wcf<CategoryService>())
            {
                var channel = fact.CreateChannel();
                TB_Category category = channel.QuerySingle(new TB_CategoryQueryObject { QueryCondition = t => t.CategoryId == id }).Cast<TB_Category>();
                category.CategoryName = Request["categoryName"].ToString();
                if (!channel.Update(category))
                {
                    return ERROR("update faild !");
                }
            }
            return OK("update succeed !");
        }

        [AuthenCheckAttribute(LimitCode = 1020)]
        public ActionResult DeleteDeal(int id)
        {
            using (var fact = Wcf<CategoryService>())
            {
                var channel = fact.CreateChannel();
                TB_Category category = channel.QuerySingle(new TB_CategoryQueryObject { QueryCondition = t => t.CategoryId == id }).Cast<TB_Category>();

                channel.QuerySql(new TB_CategoryQueryObject
                {
                    SqlExecuteType = App.Base.Options.ExecuteType.ExecuteNonQuery,
                    SqlStatementTextOrSpName = $"update TB_Book set CategoryId=1 where CategoryId={id}"
                });

                if (!channel.Delete(category))
                {
                    return ERROR("delete faild !");
                }
            }
            return OK("delete succeed !");
        }
    }
}