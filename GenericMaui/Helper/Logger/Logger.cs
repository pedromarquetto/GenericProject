using GenericMaui.Helper.Enums;
using GenericMaui.Sql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.Helper.Logger
{
    public static class Logger
    {
        public static void Log(string message,SqlContext sqlContext,LogTypeEnum logType = LogTypeEnum.Warning)
        {
            LogClass log = new LogClass
            {
                Message = message,
                LogType = logType,
                Date = DateTime.Now
            };

            Console.WriteLine($"LOG - {DateTime.Now} - {message} - {logType}");

            sqlContext.Insert(log);
        }
    }
}
