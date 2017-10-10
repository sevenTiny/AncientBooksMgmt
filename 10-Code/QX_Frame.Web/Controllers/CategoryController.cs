using QX_Frame.App.Web;
using QX_Frame.Data.Entities;
using QX_Frame.Data.QueryObject;
using QX_Frame.Data.Service;
using QX_Frame.Web.Filter;
using System.Collections.Generic;
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
            using (var fact = Wcf<CategoryService>())
            {
                var channel = fact.CreateChannel();
                List<TB_Category> categoryList = channel.QueryAll(new TB_CategoryQueryObject()).Cast<List<TB_Category>>();
                return View(categoryList);
            }
        }

        [AuthenCheckAttribute(LimitCode = 1018)]
        public ActionResult AddDeal()
        {
            using (var fact = Wcf<CategoryService>())
            {
                var channel = fact.CreateChannel();
                if (!channel.Add(new TB_Category { CategoryName = Request["categoryName"].ToString() }))
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