   M S B A M L   `   `   `  ����H  DProyectoFinal, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:ProyectoFinal.VistasProyectoFinal.Vistas  5      &     ProyectoFinal.Vistas.VistaVentas   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      4local"clr-namespace:ProyectoFinal.Vistas     5      b ^MaterialDesignThemes.Wpf, Version=4.0.0.2422, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5        
�������
����� �  � 	Resources  5
       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $e _pack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Light.xaml?�6%   �� 5      $h bpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Defaults.xaml?�6%   %    5      .��5      �  � ColumnDefinitions 5   
   �� 5      �� 5      �� 5       � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      .+�5    
   �� $��Ventas��6   $��3��6#   $��0��67   $��0��6G   .��5!      ��  �� Orientation$ Vertical=�6   .+�5#      � $��Center=�6   $��	0 15 0 15q�69   .+�5%      �� $ 
Horizontal=�6%   $��15q�6>   .+�5&      �� -   5         ��Name$ 
boxEmpresa��5&   &   $	��150��6:   $��30��6F    � ToolTip$ Empresa Compradora��6R   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Empresa Compradora*��6o   	 �� 	MaxLength$	 25��6�   6�   �� 5'      -   5        $ 	boxCodigo��5'   &   $��	10 0 10 0q�69   $	��150��6L   $��30��6X   $ Codigo de Propietario��6d   $ Codigo Contenedor*��6�   $	 4��6�   
   
HelperText$
 000A*��6�   6�   5(      �� 5*      $ 
Horizontal=�6%   $��10q�6?   .+�5+      �� -   5        $ boxPrecioVenta��5+   &   $	��150��6>   $��30��6J   $ PrecioCompra��6V   $ Precio de Compra*��6m   6�   �� 5,      -   5         ��Name$ btnRealizarCompra��5,   %   $	��150��6@   $��50��6L   $��Realizar Venta��6X   $��5 0 0 0q�6q   $��Center=�6�   6�   5-      50      52      54      � 56   
   $��1��6   $��0��6   $��3��6,   .+�57      &   System.Windows.Controls.DataGrid  -   5          Name$ TablaVentas��57      
�������$��Stretch=�6C   $��Stretch=�6a   $��20q�6}   58      59      5:      