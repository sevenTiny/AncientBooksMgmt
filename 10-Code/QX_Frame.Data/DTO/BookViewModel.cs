﻿using QX_Frame.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QX_Frame.Data.DTO
{
    public class BookViewModel
    {
        public Guid BookUid { get; set; }

        // 
        public String Title { get; set; }

        // 
        public String Title2 { get; set; }

        // 
        public string Volume { get; set; }

        // 
        public String Dynasty { get; set; }

        // 
        public int CategoryId { get; set; }

        public string CategoryName { get; set; }

        // 
        public String Functionary { get; set; }

        // 
        public String Publisher { get; set; }

        // 
        public String Version { get; set; }

        // 
        public String FromBF49 { get; set; }

        // 
        public String FromAF49 { get; set; }

        // folder name
        public String[] ImageUris { get; set; }

        //imgsName
        public string[] ImageNames { get; set; }

        // 
        public String Notice { get; set; }

        public DateTime CreateTime { get; set; }
    }
}
