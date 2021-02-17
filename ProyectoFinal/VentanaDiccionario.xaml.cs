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
using System.Windows.Shapes;

namespace ProyectoFinal
{
    /// <summary>
    /// Interaction logic for VentanaDiccionario.xaml
    /// </summary>
    public partial class VentanaDiccionario : Window
    {
        public Conexion con = new Conexion();
        public VentanaDiccionario()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            tablaDiccionario.ItemsSource = con.DiccionarioDatos().DefaultView;
        }
    }
}
