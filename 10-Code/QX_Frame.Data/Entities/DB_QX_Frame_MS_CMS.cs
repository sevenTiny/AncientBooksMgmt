namespace QX_Frame.Data.Entities
{
    using QX_Frame.Bantina.Bankinate;
    using QX_Frame.Data.Configs;

    public partial class DB_QX_Frame_MS_CMS : Bankinate
    {
        public DB_QX_Frame_MS_CMS()
            : base(QX_Frame_Data_Config.ConnectionString_DB_QX_Frame_CMS)
        {
        }

    }
}
