   M S B A M L   `   `   `  ����H  DProyectoFinal, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:ProyectoFinal.VistasProyectoFinal.Vistas  5   	       ProyectoFinal.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:ProyectoFinal.Vistas     5   	   b ^MaterialDesignThemes.Wpf, Version=4.0.0.2422, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   -   5          � Title$!  EMN Logistics Server Client��5	   	   $	��600��6-   $	��900��6:   $	��600��6F   $	��900��6V    � WindowStartupLocation$ CenterScreen=�6|    � 	Resources 5       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $e _pack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Light.xaml?�6%   �� 5      $h bpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Defaults.xaml?�6%   %    5      .��5      �  � ColumnDefinitions 5   
   �� 5      $
��auto �6   �� 5      �� 5      .+�5   
   � -   5         �Name$ MenuLateral��5      $��0��6   $	��220��64   ���#112d4e � RowDefinitions 5      �� 5      $
��auto �6    �� 5      �� 5      .+�5#      � $��0��6   
�������.+�5$      �� $"��/Recursos/EmarketniLogo2.png��6   $	��200��6>   5%      �� 5'      $��1��6   $��2��6&   $��Center=�67   .+�5(      �� $��0q�6   $��Stretch=�6/   
������ $
��Left=�6d   
�������.@�5)      �� -   5         ��Name$ itemClientes��5)   $   $��15q�6:   .��5*      �� 	 �� Orientation$	 
Horizontal=�6%   .+�5+      '  !MaterialDesignThemes.Wpf.PackIcon  
   Kind$
 Account=�66   $��Center=�6E   $��5q�6`   �� 5,      $��Clientes��6(   
�������$��Center=�6K   5-      5.      �� 5/      -   5        $ itemProveedores��5/   #   $��15q�6<   .��50      �� $	 
Horizontal=�6%   .+�51        $
 
AccountKey=�66   $��Center=�6H   $��5q�6c   �� 52      $��Proveedores��6(   
�������$��Center=�6N   53      54      �� 55      -   5        $ itemCompras��55   #   $��15q�68   .��56      �� $	 
Horizontal=�6%   .+�57        $
 Trolley=�66   $��Center=�6E   $��5q�6`   �� 58      $��Compras��6(   
�������$��Center=�6J   59      5:      �� 5;      -   5        $ 
itemVentas��5;   #   $��15q�67   .��5<      �� $	 
Horizontal=�6%   .+�5=        $

 Sale=�66   $��Center=�6B   $��5q�6]   �� 5>      $��Ventas��6(   
�������$��Center=�6I   5?      5@      �� 5A      -   5        $ itemGanancias��5A   #   $��15q�6:   .��5B      �� $	 
Horizontal=�6%   .+�5C        $
 AccountBalanceWallet=�66   $��Center=�6R   $��5q�6m   �� 5D      $��	Ganancias��6(   
�������$��Center=�6L   5E      5F      5G      � 5I       5J      �� 5K      $
��auto �6+   �� 5L      $
��auto �6+   .+�5O      �� -   5         ��Name$ btnCerrarVistas��5O      $��Stretch=�66   $��50��6T   $��0q�6`   $��0��6�   $��5q�6�   .��5P      �� $	 
Horizontal=�6%   .+�5Q        $
 	CloseBold=�66   $��Center=�6G   $��0 0 5 0q�6b   �� 5R      $��Cerrar Vistas��6(   $
��12pt(�6=   5S      5T      �� 5U      -	   5        $ btnAbrirDiccionario��5U      $��50��6:   $��50��6F   $��1��6Q    � ToolTip$" Mostrar Diccionario de Datos��6a   $��8 5 5 5q�6�   .��5V        $
 AboutCircle=�62   5W      5X      5Z      5[      � 5]   
   $��1��6   $��2��6   
�������.+�5^      (   "ProyectoFinal.Vistas.VistaClientes  -
   5          Name$ VistaCliente��5^   "   $y�	Collapsed=�68   $��Stretch=�6O   $��Stretch=�6k   $��5q�6�   +   %ProyectoFinal.Vistas.VistaProveedores  5_      -   5          Name$ VistaProveedor��5_   %   $y�	Collapsed=�6=   $��Stretch=�6T   $��Stretch=�6p   $��5q�6�   '   !ProyectoFinal.Vistas.VistaCompras  5`      -   5          Name$ VistaCompras��5`   !   $y�	Collapsed=�67   $��Stretch=�6N   $��Stretch=�6j   $��5q�6�   &    ProyectoFinal.Vistas.VistaVentas  5a      -   5          Name$ VistaVentas��5a       $y�	Collapsed=�65   $��Stretch=�6L   $��Stretch=�6h   $��5q�6�   )   #ProyectoFinal.Vistas.VistaGanancias  5b      -   5          Name$ VistaGanancias��5b   #   $y�	Collapsed=�6;   $��Stretch=�6R   $��Stretch=�6n   $��5q�6�   5c      5d      5e      