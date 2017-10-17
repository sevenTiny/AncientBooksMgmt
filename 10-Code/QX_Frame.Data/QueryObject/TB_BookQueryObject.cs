using QX_Frame.App.Base;
using QX_Frame.Data.Entities;
using System;
using System.Linq.Expressions;

/**
 * copyright qixiao code builder ->
 * version:4.2.0
 * author:qixiao(柒小)
 * create:2017-08-10 16:13:46
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
		public String Volume { get;set; }

		// 
		public String Dynasty { get;set; }

		// 
		public Int32 CategoryId { get;set; }

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
		public String NameFan { get; set; }
		public String NameJian { get; set; }

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

			if (this.CategoryId>1)
			{
				func = func.And(tt => tt.CategoryId == this.CategoryId);
			}

			if (!string.IsNullOrEmpty(this.Title))
			{
				func = func.And(tt => tt.Title.Contains(this.Title) || tt.Title.Contains(this.NameFan) || tt.Title.Contains(this.NameJian));
			}

			return func;
		}
	}
}
