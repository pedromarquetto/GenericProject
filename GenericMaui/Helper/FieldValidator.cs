using GenericMaui.MVVM.Models;
using GenericMaui.MVVM.Views.CustomComponents;
using GenericMaui.Sql;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.Helper
{
    public static class FieldValidatior
    {
        private static readonly SqlContext _db = new SqlContext();
        public static ObservableCollection<SystemScreenField> GetFields(string screen)
        {
            return _db.Get(new SystemScreenField(),"SystemScreenId",screen);
        }
    }
}
