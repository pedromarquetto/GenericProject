using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.Helper.Enums
{
    public enum LoginStateEnum : int
    {
        NotConfigured = 0,
        Configured = 1,
        UserNotLogged = 2,
        UserLogged = 3
    }
    public enum LogTypeEnum : int
    {
        Info = 0,
        Warning = 1,
        Error = 2
    }
}
