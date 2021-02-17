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
    /// Interaction logic for VistaCompras.xaml
    /// </summary>
    public partial class VistaCompras : UserControl
    {

        public Conexion con = new Conexion();
        public VistaCompras()
        {
            InitializeComponent();
        }

        private void ReiniciaCajas()
        {
            boxCodigo.Text = "";
            boxEmpresa.Text = "";
            boxPrecioCompra.Text = "";
            ComboSizeContenedor.SelectedIndex = 0;
            ComboTipos.SelectedIndex = 0;
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

        private void boxPrecioCompra_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Regex.IsMatch(e.Text, "\\D"))
            {
                e.Handled = true;
            }
        }

        private void boxPrecioCompra_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            e.Handled = e.Key == Key.Space;
        }

        private void btnRealizarCompra_Click(object sender, RoutedEventArgs e)
        {
            if (boxEmpresa.Text != "" || boxCodigo.Text != "" || boxPrecioCompra.Text != "")
            {                
                switch (ComboTipos.SelectedIndex)
                {
                    case 1://DryContainer
                        if (ComboSizeContenedor.SelectedIndex.Equals(1))
                        {
                            con.NuevaCompra(boxEmpresa.Text, float.Parse(boxPrecioCompra.Text), 20, boxCodigo.Text, "DryContainer");
                            MessageBox.Show("Haz comprado un DryContainer de 20 Pies", "Felicidades!", MessageBoxButton.OK, MessageBoxImage.Information);

                        }
                        else
                        {
                            con.NuevaCompra(boxEmpresa.Text, float.Parse(boxPrecioCompra.Text), 40, boxCodigo.Text, "DryContainer");
                            MessageBox.Show("Haz comprado un DryContainer de 40 Pies", "Felicidades!", MessageBoxButton.OK, MessageBoxImage.Information);

                        }
                        break;
                    case 2://Flatrack
                        if (ComboSizeContenedor.SelectedIndex.Equals(1))
                        {
                            con.NuevaCompra(boxEmpresa.Text, float.Parse(boxPrecioCompra.Text), 20, boxCodigo.Text, "FlatRack");
                            MessageBox.Show("Haz comprado un FlatRack de 20 Pies", "Felicidades!", MessageBoxButton.OK, MessageBoxImage.Information);

                        }
                        else
                        {
                            con.NuevaCompra(boxEmpresa.Text, float.Parse(boxPrecioCompra.Text), 40, boxCodigo.Text, "FlatRack");
                            MessageBox.Show("Haz comprado un FlatRack de 40 Pies", "Felicidades!", MessageBoxButton.OK, MessageBoxImage.Information);

                        }
                        break;
                    case 3://OpenTop
                        if (ComboSizeContenedor.SelectedIndex.Equals(1))
                        {
                            con.NuevaCompra(boxEmpresa.Text, float.Parse(boxPrecioCompra.Text), 20, boxCodigo.Text, "OpenTop");
                            MessageBox.Show("Haz comprado un OpenTop de 20 Pies", "Felicidades!", MessageBoxButton.OK, MessageBoxImage.Information);

                        }
                        else
                        {
                            con.NuevaCompra(boxEmpresa.Text, float.Parse(boxPrecioCompra.Text), 40, boxCodigo.Text, "OpenTop");
                            MessageBox.Show("Haz comprado un OpenTop de 40 Pies", "Felicidades!", MessageBoxButton.OK, MessageBoxImage.Information);

                        }
                        break;
                    case 4://Reefer
                        if (ComboSizeContenedor.SelectedIndex.Equals(1))
                        {
                            con.NuevaCompra(boxEmpresa.Text, float.Parse(boxPrecioCompra.Text), 20, boxCodigo.Text, "Reefer");
                            MessageBox.Show("Haz comprado un Reefer de 20 Pies", "Felicidades!", MessageBoxButton.OK, MessageBoxImage.Information);

                        }
                        else
                        {
                            con.NuevaCompra(boxEmpresa.Text, float.Parse(boxPrecioCompra.Text), 40, boxCodigo.Text, "Reefer");
                            MessageBox.Show("Haz comprado un Reefer de 40 Pies", "Felicidades!", MessageBoxButton.OK, MessageBoxImage.Information);

                        }
                        break;
                    default:
                        MessageBox.Show("Porfavor Seleccione un Tipo", "Advertencia", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                        ComboTipos.Focus();
                        break;
                }

                ReiniciaCajas();
                RecargarTabla();
            }
            else
            {
                MessageBox.Show("Porfavor llene todos los campos", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            TablaCompras.ItemsSource = con.ListarContenedoresComprados().DefaultView;
        }

        private void RecargarTabla()
        {
            TablaCompras.ItemsSource = null;
            TablaCompras.ItemsSource = con.ListarContenedoresComprados().DefaultView;
        }
    }
}
