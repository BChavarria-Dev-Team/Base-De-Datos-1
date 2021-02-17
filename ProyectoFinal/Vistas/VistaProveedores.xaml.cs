using System;
using System.Collections.Generic;
using System.Data;
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
    /// Interaction logic for VistaProveedores.xaml
    /// </summary>
    public partial class VistaProveedores : UserControl
    {
        public Conexion con = new Conexion();
        public VistaProveedores()
        {
            InitializeComponent();
        }

        private void boxTelefonoEmpresa_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            e.Handled = e.Key == Key.Space;
        }

        private void boxTelefonoEmpresa_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Regex.IsMatch(e.Text, "\\D"))
            {
                e.Handled = true;
            }
        }

        private void boxTelefonoPriv_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            e.Handled = e.Key == Key.Space;
        }

        private void boxTelefonoPriv_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Regex.IsMatch(e.Text, "\\D"))
            {
                e.Handled = true;
            }
        }

        private void boxRUC_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            e.Handled = e.Key == Key.Space;
        }

        private void boxRUC_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Regex.IsMatch(e.Text, "\\D"))
            {
                e.Handled = true;
            }
        }

        bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        private void boxApellidoContacto_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            e.Handled = e.Key == Key.Space;
        }

        private void boxNombreContacto_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            e.Handled = e.Key == Key.Space;
        }

        private void boxNombreEmpresa_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Regex.IsMatch(e.Text, "\\d"))
            {
                e.Handled = true;
            }
        }

        private void boxNombreContacto_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Regex.IsMatch(e.Text, "\\d"))
            {
                e.Handled = true;
            }
        }

        private void boxApellidoContacto_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Regex.IsMatch(e.Text, "\\d"))
            {
                e.Handled = true;
            }
        }

        private void tablaClientes_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            boxNombreEmpresa.IsEnabled = false;
            boxNombreContacto.IsEnabled = false;
            boxApellidoContacto.IsEnabled = false;
            boxRUC.IsEnabled = false;
            boxCorreoEmpresa.IsEnabled = false;
            boxTelefonoEmpresa.IsEnabled = false;
            boxBusqueda.IsEnabled = false;

            boxTelefonoPriv.IsEnabled = true;
            boxCorreoPriv.IsEnabled = true;
            boxDireccion.IsEnabled = true;

            btnIngresar.IsEnabled = false;
            btnActualizar.IsEnabled = true;

            DataRowView dv = (DataRowView)tablaProveedores.SelectedItem;

            boxNombreEmpresa.Text = dv.Row.ItemArray[0].ToString();
            boxDireccion.Text = dv.Row.ItemArray[1].ToString();
            boxCorreoEmpresa.Text = dv.Row.ItemArray[2].ToString();
            boxTelefonoEmpresa.Text = dv.Row.ItemArray[3].ToString();
            boxNombreContacto.Text = dv.Row.ItemArray[4].ToString();
            boxApellidoContacto.Text = dv.Row.ItemArray[5].ToString();
            boxTelefonoPriv.Text = dv.Row.ItemArray[6].ToString();
            boxCorreoPriv.Text = dv.Row.ItemArray[7].ToString();
            boxRUC.Text = dv.Row.ItemArray[8].ToString();

        }

        private void btnIngresar_Click(object sender, RoutedEventArgs e)
        {

            if (boxNombreEmpresa.Text != "" || boxNombreContacto.Text != "" || boxApellidoContacto.Text != "" || boxRUC.Text != "" || boxTelefonoEmpresa.Text != "")
            {
                if (!Regex.Match(boxNombreContacto.Text, "^[A-Z][a-zA-Z]*$").Success)
                {
                    // first name was incorrect  
                    MessageBox.Show("Nombre Invalido", "Message", MessageBoxButton.OK, MessageBoxImage.Error);
                    boxNombreContacto.Focus();
                    return;
                }
                if (!Regex.Match(boxApellidoContacto.Text, "^[A-Z][a-zA-Z]*$").Success)
                {
                    // first name was incorrect  
                    MessageBox.Show("Apellido Invalido", "Message", MessageBoxButton.OK, MessageBoxImage.Error);
                    boxApellidoContacto.Focus();
                    return;
                }
                if (!IsValidEmail(boxCorreoEmpresa.Text).Equals(true))
                {
                    MessageBox.Show("Correo Invalido", "Message", MessageBoxButton.OK, MessageBoxImage.Error);
                    boxCorreoEmpresa.Focus();
                    return;
                }
                if (boxCorreoPriv.Text != "")
                {
                    if (!IsValidEmail(boxCorreoPriv.Text).Equals(true))
                    {
                        MessageBox.Show("Correo Invalido", "Message", MessageBoxButton.OK, MessageBoxImage.Error);
                        boxCorreoPriv.Focus();
                        return;
                    }
                    else
                    {
                        con.NuevoProveedor(boxNombreEmpresa.Text, boxNombreContacto.Text, boxApellidoContacto.Text, boxDireccion.Text, boxRUC.Text, boxCorreoEmpresa.Text, boxCorreoPriv.Text, boxTelefonoEmpresa.Text, boxTelefonoPriv.Text);
                        RecargarTabla();
                        VaciarCajas();
                    }
                }
                con.NuevoProveedor(boxNombreEmpresa.Text, boxNombreContacto.Text, boxApellidoContacto.Text, boxDireccion.Text, boxRUC.Text, boxCorreoEmpresa.Text, boxCorreoPriv.Text, boxTelefonoEmpresa.Text, boxTelefonoPriv.Text);
                RecargarTabla();
                VaciarCajas();
            }
            else
            {
                MessageBox.Show("Porfavor llene todos los campos", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            tablaProveedores.ItemsSource = con.listarProveedores().DefaultView;
        }

        private void RecargarTabla()
        {
            tablaProveedores.ItemsSource = null;
            tablaProveedores.ItemsSource = con.listarProveedores().DefaultView;
        }

        private void VaciarCajas()
        {
            boxNombreEmpresa.Text = "";
            boxNombreContacto.Text = "";
            boxApellidoContacto.Text = "";
            boxDireccion.Text = "";
            boxRUC.Text = "";
            boxCorreoEmpresa.Text = "";
            boxCorreoPriv.Text = "";
            boxTelefonoEmpresa.Text = "";
            boxTelefonoPriv.Text = "";
            boxBusqueda.Text = "";
        }

        private void btnBuscar_Click(object sender, RoutedEventArgs e)
        {
            tablaProveedores.ItemsSource = con.buscarClientes(boxBusqueda.Text).DefaultView;
        }

        private void boxBusqueda_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Regex.IsMatch(e.Text, "\\d"))
            {
                e.Handled = true;
            }
        }

        private void Recargar_Click(object sender, RoutedEventArgs e)
        {
            RecargarTabla();
            VaciarCajas();
            boxNombreEmpresa.IsEnabled = true;
            boxNombreContacto.IsEnabled = true;
            boxApellidoContacto.IsEnabled = true;
            boxRUC.IsEnabled = true;
            boxCorreoEmpresa.IsEnabled = true;
            boxTelefonoEmpresa.IsEnabled = true;
            boxBusqueda.IsEnabled = true;
            boxTelefonoPriv.IsEnabled = true;
            boxCorreoPriv.IsEnabled = true;
            boxDireccion.IsEnabled = true;
            btnIngresar.IsEnabled = true;
            btnActualizar.IsEnabled = false;
        }

        private void btnActualizar_Click(object sender, RoutedEventArgs e)
        {
            if (boxTelefonoPriv.Text != "" || boxDireccion.Text != "")
            {

                if (boxCorreoPriv.Text != "")
                {
                    if (!IsValidEmail(boxCorreoPriv.Text).Equals(true))
                    {
                        MessageBox.Show("Correo Invalido", "Message", MessageBoxButton.OK, MessageBoxImage.Error);
                        boxCorreoPriv.Focus();
                        return;
                    }
                    else
                    {
                        con.ModificarProveedor(boxNombreEmpresa.Text, boxDireccion.Text, boxCorreoPriv.Text, boxTelefonoPriv.Text);
                        VaciarCajas();
                        boxNombreEmpresa.IsEnabled = true;
                        boxNombreContacto.IsEnabled = true;
                        boxApellidoContacto.IsEnabled = true;
                        boxRUC.IsEnabled = true;
                        boxCorreoEmpresa.IsEnabled = true;
                        boxTelefonoEmpresa.IsEnabled = true;
                        boxBusqueda.IsEnabled = true;
                        boxTelefonoPriv.IsEnabled = true;
                        boxCorreoPriv.IsEnabled = true;
                        boxDireccion.IsEnabled = true;
                        btnIngresar.IsEnabled = true;
                        btnActualizar.IsEnabled = false;
                        RecargarTabla();
                    }
                }
                else
                {
                    con.ModificarProveedor(boxNombreEmpresa.Text, boxDireccion.Text, boxCorreoPriv.Text, boxTelefonoPriv.Text);
                    VaciarCajas();
                    boxNombreEmpresa.IsEnabled = true;
                    boxNombreContacto.IsEnabled = true;
                    boxApellidoContacto.IsEnabled = true;
                    boxRUC.IsEnabled = true;
                    boxCorreoEmpresa.IsEnabled = true;
                    boxTelefonoEmpresa.IsEnabled = true;
                    boxBusqueda.IsEnabled = true;
                    boxTelefonoPriv.IsEnabled = true;
                    boxCorreoPriv.IsEnabled = true;
                    boxDireccion.IsEnabled = true;
                    btnIngresar.IsEnabled = true;
                    btnActualizar.IsEnabled = false;
                    RecargarTabla();
                }
            }
            else
            {
                MessageBox.Show("Porfavor llene todos los campos", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
