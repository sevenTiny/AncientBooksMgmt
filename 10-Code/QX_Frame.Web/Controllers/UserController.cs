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

/**
 * author:qixiao
 * create:2017-8-3 10:24:39
 * */
namespace QX_Frame.Web.Controllers
{
    public class UserController : App.Web.WebControllerBase
    {
        // Login
        public ActionResult Login() => View();

        // Register
        public ActionResult Register() => View();

        // List
        public ActionResult List()
        {
            string uid = Request["uid"];
            string loginId = Request["loginId"];
            string name = Request["name"];

            Guid UserUid = default(Guid);
            Guid.TryParse(uid?.Trim(), out UserUid);


            using (var fact = Wcf<UserInfoService>())
            {
                var channel = fact.CreateChannel();

                TB_UserInfoQueryObject userInfoQuery = new TB_UserInfoQueryObject();

                userInfoQuery.UserUid = UserUid;
                userInfoQuery.LoginId = loginId;
                userInfoQuery.NickName = name;

                List<TB_UserInfo> userInfoList = channel.QueryAll(userInfoQuery).Cast<List<TB_UserInfo>>();

                List<UserViewModel> userViewModelList = new List<UserViewModel>();

                foreach (TB_UserInfo item in userInfoList)
                {
                    UserViewModel userViewModel = new UserViewModel();

                    userViewModel.UserUid = item.UserUid;
                    userViewModel.LoginId = item.LoginId;
                    userViewModel.Name = item.NickName;
                    userViewModel.LimitCode = channel.QuerySingle(new TB_UserAuthenCodesQueryObject { QueryCondition = t => t.UserUid == item.UserUid }).Cast<TB_UserAuthenCodes>().UserLimitCodes;

                    //判断账号状态是否正常
                    if (channel.QuerySingle(new TB_UserRoleStatusQueryObject { QueryCondition = t => t.UserUid == item.UserUid }).Cast<TB_UserRoleStatus>().StatusId == opt_UserStatus.NORMAL.ToInt())
                    {
                        userViewModelList.Add(userViewModel);
                    }
                }
                return View(userViewModelList);
            }
        }

        // Detail/id
        public ActionResult Detail(Guid id)
        {
            using (var fact = Wcf<UserAccountService>())
            {
                var channel = fact.CreateChannel();
                TB_UserInfo userInfo = channel.QuerySingle(new TB_UserInfoQueryObject { QueryCondition = t => t.UserUid == id }).Cast<TB_UserInfo>();
                TB_UserAuthenCodes userAuthenCodes = channel.QuerySingle(new TB_UserAuthenCodesQueryObject { QueryCondition = t => t.UserUid == id }).Cast<TB_UserAuthenCodes>();

                UserViewModel userViewModel = new UserViewModel();
                userViewModel.UserUid = id;
                userViewModel.LoginId = userInfo?.LoginId;
                userViewModel.Name = userInfo?.NickName;
                userViewModel.LimitCode = userAuthenCodes?.UserLimitCodes;
                return View(userViewModel);
            }
        }

        // Add
        public ActionResult Add() => View();

        public JsonResult AddDeal()
        {
            string loginId = Request["username"];
            string name = Request["nickName"];
            string pwd = Request["password"];

            Guid uid = Guid.NewGuid();

            bool addSuccess = true;

            Helper_DG.Transaction_Helper_DG.Transaction(() =>
            {
                using (var fact = Wcf<UserAccountService>())
                {
                    var channel = fact.CreateChannel();
                    TB_UserAccount userAccount = channel.QuerySingle(new TB_UserAccountQueryObject { QueryCondition = t => t.LoginId.Equals(loginId) }).Cast<TB_UserAccount>();
                    if (userAccount != null)
                    {
                        addSuccess = false;
                    }
                    channel.Add(new TB_UserAccount
                    {
                        UserUid = uid,
                        LoginId = loginId,
                        Password = Encrypt_Helper_DG.MD5_Encrypt(pwd)
                    });
                }
                using (var fact = Wcf<UserInfoService>())
                {
                    var channel = fact.CreateChannel();
                    addSuccess = addSuccess && channel.Add(new TB_UserInfo
                    {
                        UserUid = uid,
                        LoginId = loginId,
                        NickName = name
                    });
                }
                using (var fact = Wcf<UserAuthenCodesService>())
                {
                    var channel = fact.CreateChannel();

                    addSuccess = addSuccess && channel.Add(new TB_UserAuthenCodes
                    {
                        UserUid = uid,
                        UserLimitCodes = "",
                        UserDisplayCodes = ""
                    });
                }
            });

            if (!addSuccess)
            {
                return ERROR("该账号已存在!");
            }

            return OK("添加成功!");
        }

        // Edit
        public ActionResult Edit() => View();

        // Delete
        public ActionResult Delete()
        {
            string uid = Request["uid"];
            string loginId = Request["loginId"];
            string name = Request["name"];

            Guid UserUid = default(Guid);
            Guid.TryParse(uid?.Trim(), out UserUid);


            using (var fact = Wcf<UserInfoService>())
            {
                var channel = fact.CreateChannel();

                TB_UserInfoQueryObject userInfoQuery = new TB_UserInfoQueryObject();

                userInfoQuery.UserUid = UserUid;
                userInfoQuery.LoginId = loginId;
                userInfoQuery.NickName = name;

                List<TB_UserInfo> userInfoList = channel.QueryAll(userInfoQuery).Cast<List<TB_UserInfo>>();

                List<UserViewModel> userViewModelList = new List<UserViewModel>();

                foreach (TB_UserInfo item in userInfoList)
                {
                    UserViewModel userViewModel = new UserViewModel();

                    userViewModel.UserUid = item.UserUid;
                    userViewModel.LoginId = item.LoginId;
                    userViewModel.Name = item.NickName;
                    userViewModel.LimitCode = channel.QuerySingle(new TB_UserAuthenCodesQueryObject { QueryCondition = t => t.UserUid == item.UserUid }).Cast<TB_UserAuthenCodes>().UserLimitCodes;

                    //判断账号状态是否正常
                    if (channel.QuerySingle(new TB_UserRoleStatusQueryObject { QueryCondition = t => t.UserUid == item.UserUid }).Cast<TB_UserRoleStatus>().StatusId == opt_UserStatus.STOP.ToInt())
                    {
                        userViewModelList.Add(userViewModel);
                    }
                }
                return View(userViewModelList);
            }
        }

        //Delete Deal
        public ActionResult DeleteDeal(Guid id)
        {
            using (var fact = Wcf<UserRoleStatusService>())
            {
                var channel = fact.CreateChannel();
                TB_UserRoleStatus userRoleStatus = channel.QuerySingle(new TB_UserRoleStatusQueryObject { QueryCondition = t => t.UserUid == id }).Cast<TB_UserRoleStatus>();
                userRoleStatus.StatusId = opt_UserStatus.STOP.ToInt();
                if (channel.Update(userRoleStatus))
                {
                    return OK("删除成功！");
                }
                else
                {
                    return ERROR("删除失败！");
                }
            }
        }

        public ActionResult ReDeleteDeal(Guid id)
        {
            using (var fact = Wcf<UserRoleStatusService>())
            {
                var channel = fact.CreateChannel();
                TB_UserRoleStatus userRoleStatus = channel.QuerySingle(new TB_UserRoleStatusQueryObject { QueryCondition = t => t.UserUid == id }).Cast<TB_UserRoleStatus>();
                userRoleStatus.StatusId = opt_UserStatus.NORMAL.ToInt();
                if (channel.Update(userRoleStatus))
                {
                    return OK("恢复成功！");
                }
                else
                {
                    return ERROR("恢复失败！");
                }
            }
        }

        // Limit Magemen
        public ActionResult LimitMgmt(Guid id)
        {
            using (var fact = Wcf<UserAccountService>())
            {
                var channel = fact.CreateChannel();
                TB_UserInfo userInfo = channel.QuerySingle(new TB_UserInfoQueryObject { QueryCondition = t => t.UserUid == id }).Cast<TB_UserInfo>();
                TB_UserAuthenCodes userAuthenCodes = channel.QuerySingle(new TB_UserAuthenCodesQueryObject { QueryCondition = t => t.UserUid == id }).Cast<TB_UserAuthenCodes>();

                UserViewModel userViewModel = new UserViewModel();
                userViewModel.UserUid = id;
                userViewModel.LoginId = userInfo?.LoginId;
                userViewModel.Name = userInfo?.NickName;
                userViewModel.LimitCode = userAuthenCodes?.UserLimitCodes;
                userViewModel.DisplayCode = userAuthenCodes?.UserDisplayCodes;

                LimitViewModel limitViewModel = new LimitViewModel();
                limitViewModel.UserViewModel = userViewModel;
                limitViewModel.LimitCodeList = channel.QueryAll(new TB_LimitCodeQueryObject()).Cast<List<TB_LimitCode>>();
                limitViewModel.DisplayCodeList = channel.QueryAll(new TB_DisplayCodeQueryObject()).Cast<List<TB_DisplayCode>>();

                return View(limitViewModel);
            }
        }

        // Limit Update
        public ActionResult LimitUpdate(Guid id)
        {
            string limitCode = Request["limitCode"];
            string displayCode = Request["displayCode"];

            using (var fact = Wcf<UserAuthenCodesService>())
            {
                var channel = fact.CreateChannel();
                TB_UserAuthenCodes userAuthenCodes = channel.QuerySingle(new TB_UserAuthenCodesQueryObject { QueryCondition = t => t.UserUid == id }).Cast<TB_UserAuthenCodes>();
                userAuthenCodes.UserLimitCodes = limitCode;
                userAuthenCodes.UserDisplayCodes = displayCode;

                if (channel.Update(userAuthenCodes))
                {
                    return OK("修改成功！");
                }
                else
                {
                    return ERROR("修改失败！");
                }
            }
        }

        [HttpPost]
        public ActionResult LoginDeal()
        {
            string account = Request["account"];
            string password = Request["password"];
            string validateCode = Request["validateCode"];
            int online = Request["online"].ToInt();

            if (!Cache_Helper_DG.Cache_Get("ValidateCode").ToString().ToUpper().Equals(validateCode.ToUpper()))
            {
                return ERROR("验证码错误！");
            }

            using (var fact = Wcf<UserAccountService>())
            {
                var channel = fact.CreateChannel();
                TB_UserAccount userAccount = channel.QuerySingle(new TB_UserAccountQueryObject { QueryCondition = t => t.LoginId.Equals(account) }).Cast<TB_UserAccount>();
                if (userAccount != null)
                {
                    if (userAccount.Password.Equals(Encrypt_Helper_DG.MD5_Encrypt(password)))
                    {
                        Session["uid"] = userAccount.UserUid;
                        Session["loginId"] = userAccount.LoginId;
                        if (online == 1)
                        {
                            Cookie_Helper_DG.Add("loginId", userAccount.LoginId, DateTime.Now.AddDays(1));
                            Cookie_Helper_DG.Add("uid", userAccount.UserUid.ToString(), DateTime.Now.AddDays(1));
                        }
                        return OK("登录成功！");
                    }
                }
                return ERROR("账号或密码错误！");
            }
        }

        public ActionResult LoginOut()
        {
            Session.Remove("uid");
            Session.Remove("loginId");
            return Redirect("/User/Login");
        }


    }
}