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

namespace ProyectoFinal
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnCerrarVistas_Click(object sender, RoutedEventArgs e)
        {
            VistaCliente.Visibility = Visibility.Collapsed;
            VistaProveedor.Visibility = Visibility.Collapsed;
            VistaCompras.Visibility = Visibility.Collapsed;
            VistaVentas.Visibility = Visibility.Collapsed;
            VistaGanancias.Visibility = Visibility.Collapsed;

            itemClientes.IsSelected = false;
            itemCompras.IsSelected = false;
            itemGanancias.IsSelected = false;
            itemProveedores.IsSelected = false;
            itemVentas.IsSelected = false;
        }

        private void itemClientes_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            setActiveControl(VistaCliente);
        }

        private void itemProveedores_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            setActiveControl(VistaProveedor);
        }

        private void itemCompras_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            setActiveControl(VistaCompras);
        }

        private void itemVentas_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            setActiveControl(VistaVentas);
        }

        private void itemGanancias_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            setActiveControl(VistaGanancias);
        }

        private void setActiveControl (UserControl control)
        {
            VistaCliente.Visibility = Visibility.Collapsed;
            VistaProveedor.Visibility = Visibility.Collapsed;
            VistaCompras.Visibility = Visibility.Collapsed;
            VistaVentas.Visibility = Visibility.Collapsed;
            VistaGanancias.Visibility = Visibility.Collapsed;

            control.Visibility = Visibility.Visible;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            this.MaxHeight = SystemParameters.MaximizedPrimaryScreenHeight;
        }

        private void btnAbrirDiccionario_Click(object sender, RoutedEventArgs e)
        {
            VentanaDiccionario vd = new VentanaDiccionario();
            vd.Show();
        }
    }
}
