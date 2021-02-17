using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ProyectoFinal.Vistas
{
    /// <summary>
    /// Interaction logic for VistaGanancias.xaml
    /// </summary>
    public partial class VistaGanancias : UserControl
    {
        public Conexion con = new Conexion();
        public VistaGanancias()
        {
            InitializeComponent();
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            tablaGanancias.ItemsSource = con.ListarGanancias().DefaultView;
        }

        private void tablaGanancias_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            tablaGanancias.ItemsSource = null;
            tablaGanancias.ItemsSource = con.ListarGanancias().DefaultView;
        }
    }
}
