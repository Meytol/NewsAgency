using System;
using System.Collections.Generic;
using System.Text;

namespace BusinessLogicLayer.ViewModels.Comment
{
    public class NewsCommentSection
    {
        public IList<DataAccessLayer.Entities.Comment> Comments { get; set; }
    }
}
