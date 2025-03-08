using GenericMaui.Sql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.Helper.Logger
{
    public class PMSException
    {
        private readonly SqlContext _sqlContext = new SqlContext();
        public PMSException(string message)
        {
            Logger.Log(message, _sqlContext);
        }
    }
}
