using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HoTroTimNhaTro.Startup))]
namespace HoTroTimNhaTro
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
