using QX_Frame.App.Base;
using QX_Frame.Data.Entities;
using System;
using System.Linq.Expressions;

/**
 * copyright qixiao code builder ->
 * version:4.2.0
 * author:qixiao(柒小)
 * create:2017-08-11 15:37:23
 **/

namespace QX_Frame.Data.QueryObject
{
	/// <summary>
	///class TB_CmsStatusQueryObject
	/// </summary>
	public class TB_CmsStatusQueryObject:WcfQueryObject<DB_QX_Frame_MS_CMS, TB_CmsStatus>
	{
		/// <summary>
		/// construction method
		/// </summary>
		public TB_CmsStatusQueryObject()
		{}

		// PK（identity）  
		public Guid CmsUid { get;set; }

		// 
		public Int32 StatusId { get;set; }

		//query condition // null default
		public override Expression<Func<TB_CmsStatus, bool>> QueryCondition {get { return base.QueryCondition; } set { base.QueryCondition = value; } }

		//query condition func // true default //if QueryCondition != null this will be override !!!
		protected override Expression<Func<TB_CmsStatus, bool>> QueryConditionFunc()
		{
			Expression<Func<TB_CmsStatus, bool>> func = t => true;

			if (!string.IsNullOrEmpty(""))
			{
				func = func.And(t => true);
			}

			return func;
		}
	}
}
