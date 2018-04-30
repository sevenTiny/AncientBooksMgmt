using QX_Frame.Bantina.Configs;
using QX_Frame.ConsoleApp.Config;
using SevenTiny.Bantina.Bankinate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QX_Frame.ConsoleApp
{
    public class CmsDbContext : SqlServerDbContext<CmsDbContext>
    {
        public CmsDbContext() : base(QX_Frame_Helper_DG_Config.ConnectionString_DB_QX_Frame_Default)
        {
            LocalCache = true;
        }
    }
}
