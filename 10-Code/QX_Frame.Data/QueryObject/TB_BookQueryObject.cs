using QX_Frame.App.Base;
using QX_Frame.Data.Entities;
using System;
using System.Linq.Expressions;

/**
 * copyright qixiao code builder ->
 * version:4.2.0
 * author:qixiao(柒小)
 * create:2017-08-08 13:39:56
 **/

namespace QX_Frame.Data.QueryObject
{
	/// <summary>
	///class TB_BookQueryObject
	/// </summary>
	public class TB_BookQueryObject:WcfQueryObject<DB_QX_Frame_MS_CMS, TB_Book>
	{
		/// <summary>
		/// construction method
		/// </summary>
		public TB_BookQueryObject()
		{}

		// PK（identity）  
		public Guid BookUid { get;set; }

		// 
		public String Title { get;set; }

		// 
		public String Title2 { get;set; }

		// 
		public Int32 Volume { get;set; }

		// 
		public String Dynasty { get;set; }

		// 
		public Int32 ClassId { get;set; }

		// 
		public String Functionary { get;set; }

		// 
		public String Publisher { get;set; }

		// 
		public String Version { get;set; }

		// 
		public String FromBF49 { get;set; }

		// 
		public String FromAF49 { get;set; }

		// 
		public String ImageUris { get;set; }

		// 
		public String Notice { get;set; }

		//query condition // null default
		public override Expression<Func<TB_Book, bool>> QueryCondition {get { return base.QueryCondition; } set { base.QueryCondition = value; } }

		//query condition func // true default //if QueryCondition != null this will be override !!!
		protected override Expression<Func<TB_Book, bool>> QueryConditionFunc()
		{
			Expression<Func<TB_Book, bool>> func = t => true;

			if (!string.IsNullOrEmpty(""))
			{
				func = func.And(t => true);
			}

			return func;
		}
	}
}