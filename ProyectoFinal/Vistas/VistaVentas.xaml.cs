using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Interaction logic for VistaVentas.xaml
    /// </summary>
    public partial class VistaVentas : UserControl
    {
        public Conexion con = new Conexion();
        public VistaVentas()
        {
            InitializeComponent();
        }

        private void boxEmpresa_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Regex.IsMatch(e.Text, "\\d"))
            {
                e.Handled = true;
            }
        }

        private void boxCodigo_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            e.Handled = e.Key == Key.Space;
        }

        private void boxPrecioVenta_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Regex.IsMatch(e.Text, "\\D"))
            {
                e.Handled = true;
            }
        }

        private void boxPrecioVenta_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            e.Handled = e.Key == Key.Space;
        }

        private void btnRealizarCompra_Click(object sender, RoutedEventArgs e)
        {
            if (boxEmpresa.Text != "" || boxCodigo.Text != "" ||boxPrecioVenta.Text != "")
            {
                con.NuevaVenta(boxEmpresa.Text,float.Parse(boxPrecioVenta.Text),boxCodigo.Text);
                VaciarCajas();
                RecargaTabla();
            }
            else
            {
                MessageBox.Show("Porfavor llene todos los campos", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            TablaVentas.ItemsSource = con.ListarContenedoresVendidos().DefaultView;
        }

        private void RecargaTabla()
        {
            TablaVentas.ItemsSource = null;
            TablaVentas.ItemsSource = con.ListarContenedoresVendidos().DefaultView;
        }

        private void VaciarCajas()
        {
            boxCodigo.Text = "";
            boxEmpresa.Text = "";
            boxPrecioVenta.Text = "";
        }
    }
}
