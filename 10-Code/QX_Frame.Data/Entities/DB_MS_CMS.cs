using QX_Frame.Bantina.Configs;
using SevenTiny.Bantina.Bankinate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QX_Frame.Data.Entities
{
    public class DB_MS_CMS : SqlServerDbContext<DB_MS_CMS>
    {
        public DB_MS_CMS() : base(QX_Frame_Helper_DG_Config.ConnectionString_DB_QX_Frame_Default)
        {
            LocalCache = false;
        }
    }
}
