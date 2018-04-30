using QX_Frame.Data.Entities;
using System.Collections.Generic;

namespace QX_Frame.Data.DTO
{
    public class BookCategoryViewModel
    {
        public BookViewModel BookViewModel { get; set; }

        public List<BookViewModel> BookViewModelList { get; set; }        
        //
        public List<TB_Category> CategoryList { get; set; }

        public int TotalCount { get; set; }

    }
}
