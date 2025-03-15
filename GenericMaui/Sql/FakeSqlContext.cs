using GenericMaui.Helper.Logger;
using GenericMaui.MVVM.Models;
using SQLite;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.Sql
{
    // No FakeSqlContext, crie um construtor que aceite um diretório para o banco de dados
    public class FakeSqlContext : SqlContext
    {
        public FakeSqlContext(string dbDirectory) : base(dbDirectory)
        {
        }
        public override ObservableCollection<T> Get<T>(T item, string? column = null, string? value = null)
        {
            return base.Get(item, column, value);
        }
        public override int Insert<T>(T item)
        {
            return base.Insert(item);
        }
        public override int Update<T>(T item)
        {
            return base.Update(item);
        }
        public override int Delete<T>(T item)
        {
            return base.Delete(item);
        }
    }

}

