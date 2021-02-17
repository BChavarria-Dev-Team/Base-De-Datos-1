using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ProyectoFinal
{
    public class Conexion
    {
        public SqlConnection Connect = new SqlConnection(@"Server=BRUNO-VBOOK15\SQLEXPRESS;Database=New EMN Logistics;Trusted_Connection=True");


        //Clientes
        public DataTable listarClientes()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ListarClientes";
            cmd.Connection = Connect;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
       
        public DataTable buscarClientes(string nombreEmpresa)
        {
            using (SqlConnection Connect = new SqlConnection(@"Server=BRUNO-VBOOK15\SQLEXPRESS;Database=New EMN Logistics;Trusted_Connection=True"))
            {
                SqlCommand cmd = new SqlCommand()
                {
                    /* En esta llave se pueden settear algunas variables del objeto al crearlo */
                    CommandText = "BuscaClienteNombre",
                    CommandType = CommandType.StoredProcedure,
                    Connection = Connect
                };

                cmd.Parameters.Add(new SqlParameter("@NombreEmpresa", nombreEmpresa) { SqlDbType = SqlDbType.NVarChar });

                /* Creamos el DataSet que contendra todas la tablas que regrese el procedimiento almacenado */
                DataSet ds = new DataSet();
                new SqlDataAdapter(cmd).Fill(ds);

                /* Esto se lo pasas a tu ItemSource de una tabla. 
                    * Esto solo devuelve la primera tabla, en caso de que si hubiera. Asi no te tienes que preocupar en nombrar una tabla.
                    * EFECTOS SECUNDARIOS: Si el proc. Almacenado no devuelve una tabla o mas, esto dara error.
                    */
                return ds.Tables[0];
            }
        }

        public void NuevoCliente(string nombreEmpresa, string nombreEmpleado, string apellidoEmpleado,string direccion, string numRUC, string correoEmpresa, string correoPriv, string TelEmpresa,string TelPrivado)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                SqlParameter[] param = new SqlParameter[9];
                param[0] = new SqlParameter("@NombreEmpresa", SqlDbType.NVarChar);
                param[0].Value = nombreEmpresa;
                param[1] = new SqlParameter("@NombreEmpleado", SqlDbType.NVarChar);
                param[1].Value = nombreEmpleado;
                param[2] = new SqlParameter("@ApellidoEmpleado", SqlDbType.NVarChar);
                param[2].Value = apellidoEmpleado;
                param[3] = new SqlParameter("@Direccion", SqlDbType.NVarChar);
                param[3].Value = direccion;
                param[4] = new SqlParameter("@RUC", SqlDbType.Char);
                param[4].Value = numRUC;
                param[5] = new SqlParameter("@CorreoEmpresa", SqlDbType.NVarChar);
                param[5].Value = correoEmpresa;
                param[6] = new SqlParameter("@CorreoPriv", SqlDbType.NVarChar);
                param[6].Value = correoPriv;
                param[7] = new SqlParameter("@TelefonoEmpresa", SqlDbType.Char);
                param[7].Value = TelEmpresa;
                param[8] = new SqlParameter("@TelefonoPriv", SqlDbType.Char);
                param[8].Value = TelPrivado;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "NuevoCliente";
                cmd.Connection = Connect;
                cmd.Parameters.AddRange(param);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);

                MessageBox.Show("Cliente Registrado", "Informacion", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception)
            {
                MessageBox.Show("Error en la insercion", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public void ModificarCliente(string nombreEmpresa, string Direccion, string CorreoPriv, string TelPriv)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                SqlParameter[] param = new SqlParameter[4];
                param[0] = new SqlParameter("@NombreEmpresa", SqlDbType.NVarChar);
                param[0].Value = nombreEmpresa;
                param[1] = new SqlParameter("@Direccion", SqlDbType.NVarChar);
                param[1].Value = Direccion;
                param[2] = new SqlParameter("@CorreoPriv", SqlDbType.NVarChar);
                param[2].Value = CorreoPriv;
                param[3] = new SqlParameter("@TelefonoPriv", SqlDbType.NVarChar);
                param[3].Value = TelPriv;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "ModificaCliente";
                cmd.Connection = Connect;
                cmd.Parameters.AddRange(param);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                MessageBox.Show("Cliente Actualizado", "Informacion", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception)
            {

                MessageBox.Show("Error en la Actualizacion", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        
        //Proveedores
        public DataTable listarProveedores()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ListarProveedores";
            cmd.Connection = Connect;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public DataTable buscarProveedores(string nombreEmpresa)
        {
            using (SqlConnection Connect = new SqlConnection(@"Server=BRUNO-VBOOK15\SQLEXPRESS;Database=New EMN Logistics;Trusted_Connection=True"))
            {
                SqlCommand cmd = new SqlCommand()
                {
                    /* En esta llave se pueden settear algunas variables del objeto al crearlo */
                    CommandText = "BuscaProveedorNombre",
                    CommandType = CommandType.StoredProcedure,
                    Connection = Connect
                };

                cmd.Parameters.Add(new SqlParameter("@NombreEmpresa", nombreEmpresa) { SqlDbType = SqlDbType.NVarChar });

                /* Creamos el DataSet que contendra todas la tablas que regrese el procedimiento almacenado */
                DataSet ds = new DataSet();
                new SqlDataAdapter(cmd).Fill(ds);

                /* Esto se lo pasas a tu ItemSource de una tabla. 
                    * Esto solo devuelve la primera tabla, en caso de que si hubiera. Asi no te tienes que preocupar en nombrar una tabla.
                    * EFECTOS SECUNDARIOS: Si el proc. Almacenado no devuelve una tabla o mas, esto dara error.
                    */
                return ds.Tables[0];
            }
        }//Me ayudaron XD

        public void NuevoProveedor(string nombreEmpresa, string nombreEmpleado, string apellidoEmpleado, string direccion, string numRUC, string correoEmpresa, string correoPriv, string TelEmpresa, string TelPrivado)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                SqlParameter[] param = new SqlParameter[9];
                param[0] = new SqlParameter("@NombreEmpresa", SqlDbType.NVarChar);
                param[0].Value = nombreEmpresa;
                param[1] = new SqlParameter("@NombreEmpleado", SqlDbType.NVarChar);
                param[1].Value = nombreEmpleado;
                param[2] = new SqlParameter("@ApellidoEmpleado", SqlDbType.NVarChar);
                param[2].Value = apellidoEmpleado;
                param[3] = new SqlParameter("@Direccion", SqlDbType.NVarChar);
                param[3].Value = direccion;
                param[4] = new SqlParameter("@RUC", SqlDbType.Char);
                param[4].Value = numRUC;
                param[5] = new SqlParameter("@CorreoEmpresa", SqlDbType.NVarChar);
                param[5].Value = correoEmpresa;
                param[6] = new SqlParameter("@CorreoPriv", SqlDbType.NVarChar);
                param[6].Value = correoPriv;
                param[7] = new SqlParameter("@TelefonoEmpresa", SqlDbType.Char);
                param[7].Value = TelEmpresa;
                param[8] = new SqlParameter("@TelefonoPriv", SqlDbType.Char);
                param[8].Value = TelPrivado;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "NuevoProveedor";
                cmd.Connection = Connect;
                cmd.Parameters.AddRange(param);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);

                MessageBox.Show("Proveedor Registrado", "Informacion", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception)
            {
                MessageBox.Show("Error en la insercion", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public void ModificarProveedor(string nombreEmpresa, string Direccion, string CorreoPriv, string TelPriv)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                SqlParameter[] param = new SqlParameter[4];
                param[0] = new SqlParameter("@NombreEmpresa", SqlDbType.NVarChar);
                param[0].Value = nombreEmpresa;
                param[1] = new SqlParameter("@Direccion", SqlDbType.NVarChar);
                param[1].Value = Direccion;
                param[2] = new SqlParameter("@CorreoPriv", SqlDbType.NVarChar);
                param[2].Value = CorreoPriv;
                param[3] = new SqlParameter("@TelefonoPriv", SqlDbType.NVarChar);
                param[3].Value = TelPriv;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "ModificaProveedor";
                cmd.Connection = Connect;
                cmd.Parameters.AddRange(param);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                MessageBox.Show("Cliente Actualizado", "Informacion", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception)
            {

                MessageBox.Show("Error en la Actualizacion", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        //Compras
        public void NuevaCompra(string NombreEmpresa, float PrecioCompra, int sizeContenedor, string CodigoProp, string tipoContenedor)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                SqlParameter[] param = new SqlParameter[5];
                param[0] = new SqlParameter("@NombreEmpresa", SqlDbType.NVarChar);
                param[0].Value = NombreEmpresa;
                param[1] = new SqlParameter("@PrecioCompra", SqlDbType.Float);
                param[1].Value = PrecioCompra;
                param[2] = new SqlParameter("@sizeContenedor", SqlDbType.TinyInt);
                param[2].Value = sizeContenedor;
                param[3] = new SqlParameter("@CodigoPropietario", SqlDbType.Char);
                param[3].Value = CodigoProp;
                param[4] = new SqlParameter("@TipoContenedor", SqlDbType.VarChar);
                param[4].Value = tipoContenedor;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "NuevaCompra";
                cmd.Connection = Connect;
                cmd.Parameters.AddRange(param);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                MessageBox.Show("Compra Registrada", "Informacion", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception)
            {
                MessageBox.Show("Error en la insercion", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public DataTable ListarContenedoresComprados()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ListarContenedoresComprados";
            cmd.Connection = Connect;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public void NuevaVenta(string NombreEmpresa, float PrecioVenta, string CodigoProp)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                SqlParameter[] param = new SqlParameter[3];
                param[0] = new SqlParameter("@NombreEmpresa", SqlDbType.NVarChar);
                param[0].Value = NombreEmpresa;
                param[1] = new SqlParameter("@PrecioVenta", SqlDbType.Float);
                param[1].Value = PrecioVenta;
                param[2] = new SqlParameter("@CodigoPropietario", SqlDbType.Char);
                param[2].Value = CodigoProp;
                
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "NuevaVenta";
                cmd.Connection = Connect;
                cmd.Parameters.AddRange(param);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                MessageBox.Show("Venta Registrada", "Informacion", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception)
            {
                MessageBox.Show("Error en la insercion", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public DataTable ListarContenedoresVendidos()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ListarContenedoresVendidos";
            cmd.Connection = Connect;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        //Ganancias
        public DataTable ListarGanancias()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ListarGanancias";
            cmd.Connection = Connect;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        //Diccionario de datos
        public DataTable DiccionarioDatos()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DiccionarioDeDatos";
            cmd.Connection = Connect;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
}
