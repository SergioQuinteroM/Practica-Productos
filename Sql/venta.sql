PGDMP     6                    {            venta    15.2    15.2 "    )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ,           1262    16481    venta    DATABASE     {   CREATE DATABASE venta WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE venta;
                postgres    false            -           0    0    SCHEMA public    ACL     y   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   pg_database_owner    false    5            �            1259    16527 	   articulos    TABLE     �   CREATE TABLE public.articulos (
    codart character varying(8) NOT NULL,
    descrip character varying(40) NOT NULL,
    precio numeric(7,2) NOT NULL,
    stock numeric(6,0),
    stock_min numeric(6,0),
    dto numeric(2,0)
);
    DROP TABLE public.articulos;
       public         heap    postgres    false            �            1259    16530    clientes    TABLE     �   CREATE TABLE public.clientes (
    codcli numeric(5,0) NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion character varying(50) NOT NULL,
    codpostal character varying(5),
    codpue character varying(5) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16533    facturas    TABLE     �   CREATE TABLE public.facturas (
    codfac numeric(6,0) NOT NULL,
    fecha date NOT NULL,
    codcli numeric(5,0),
    codven numeric(5,0),
    iva numeric(2,0),
    dto numeric(2,0)
);
    DROP TABLE public.facturas;
       public         heap    postgres    false            �            1259    16536 
   lineas_fac    TABLE     �   CREATE TABLE public.lineas_fac (
    codfac numeric(6,0) NOT NULL,
    linea numeric(2,0) NOT NULL,
    cant numeric(5,0) NOT NULL,
    codart character varying(8) NOT NULL,
    precio numeric(7,2) NOT NULL,
    dto numeric(2,0)
);
    DROP TABLE public.lineas_fac;
       public         heap    postgres    false            �            1259    16539 
   provincias    TABLE     x   CREATE TABLE public.provincias (
    codpro character varying(2) NOT NULL,
    nombre character varying(30) NOT NULL
);
    DROP TABLE public.provincias;
       public         heap    postgres    false            �            1259    16542    pueblos    TABLE     �   CREATE TABLE public.pueblos (
    codpue character varying(5) NOT NULL,
    nombre character varying(40) NOT NULL,
    codpro character varying(2) NOT NULL
);
    DROP TABLE public.pueblos;
       public         heap    postgres    false            �            1259    16545 
   vendedores    TABLE       CREATE TABLE public.vendedores (
    codven numeric(5,0) NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion character varying(50) NOT NULL,
    codpostal character varying(5),
    codpue character varying(5) NOT NULL,
    codjefe numeric(5,0)
);
    DROP TABLE public.vendedores;
       public         heap    postgres    false                       0    16527 	   articulos 
   TABLE DATA           S   COPY public.articulos (codart, descrip, precio, stock, stock_min, dto) FROM stdin;
    public          postgres    false    214   �(       !          0    16530    clientes 
   TABLE DATA           P   COPY public.clientes (codcli, nombre, direccion, codpostal, codpue) FROM stdin;
    public          postgres    false    215   h+       "          0    16533    facturas 
   TABLE DATA           K   COPY public.facturas (codfac, fecha, codcli, codven, iva, dto) FROM stdin;
    public          postgres    false    216   9.       #          0    16536 
   lineas_fac 
   TABLE DATA           N   COPY public.lineas_fac (codfac, linea, cant, codart, precio, dto) FROM stdin;
    public          postgres    false    217   �0       $          0    16539 
   provincias 
   TABLE DATA           4   COPY public.provincias (codpro, nombre) FROM stdin;
    public          postgres    false    218   m;       %          0    16542    pueblos 
   TABLE DATA           9   COPY public.pueblos (codpue, nombre, codpro) FROM stdin;
    public          postgres    false    219   <       &          0    16545 
   vendedores 
   TABLE DATA           [   COPY public.vendedores (codven, nombre, direccion, codpostal, codpue, codjefe) FROM stdin;
    public          postgres    false    220   SA       }           2606    16549    articulos articulos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.articulos
    ADD CONSTRAINT articulos_pkey PRIMARY KEY (codart);
 B   ALTER TABLE ONLY public.articulos DROP CONSTRAINT articulos_pkey;
       public            postgres    false    214                       2606    16551    clientes clientes_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (codcli);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    215            �           2606    16553    facturas facturas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (codfac);
 @   ALTER TABLE ONLY public.facturas DROP CONSTRAINT facturas_pkey;
       public            postgres    false    216            �           2606    16555    lineas_fac lineas_fac_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.lineas_fac
    ADD CONSTRAINT lineas_fac_pkey PRIMARY KEY (codfac, linea);
 D   ALTER TABLE ONLY public.lineas_fac DROP CONSTRAINT lineas_fac_pkey;
       public            postgres    false    217    217            �           2606    16557    provincias provincias_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.provincias
    ADD CONSTRAINT provincias_pkey PRIMARY KEY (codpro);
 D   ALTER TABLE ONLY public.provincias DROP CONSTRAINT provincias_pkey;
       public            postgres    false    218            �           2606    16559    pueblos pueblos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pueblos
    ADD CONSTRAINT pueblos_pkey PRIMARY KEY (codpue);
 >   ALTER TABLE ONLY public.pueblos DROP CONSTRAINT pueblos_pkey;
       public            postgres    false    219            �           2606    16561    vendedores vendedores_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.vendedores
    ADD CONSTRAINT vendedores_pkey PRIMARY KEY (codven);
 D   ALTER TABLE ONLY public.vendedores DROP CONSTRAINT vendedores_pkey;
       public            postgres    false    220            �           2606    16562    clientes clientes_codpue_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_codpue_fkey FOREIGN KEY (codpue) REFERENCES public.pueblos(codpue);
 G   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_codpue_fkey;
       public          postgres    false    219    215    3207            �           2606    16567    facturas facturas_codcli_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_codcli_fkey FOREIGN KEY (codcli) REFERENCES public.clientes(codcli);
 G   ALTER TABLE ONLY public.facturas DROP CONSTRAINT facturas_codcli_fkey;
       public          postgres    false    216    215    3199            �           2606    16572    facturas facturas_codven_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_codven_fkey FOREIGN KEY (codven) REFERENCES public.vendedores(codven);
 G   ALTER TABLE ONLY public.facturas DROP CONSTRAINT facturas_codven_fkey;
       public          postgres    false    3209    216    220            �           2606    16577 !   lineas_fac lineas_fac_codart_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lineas_fac
    ADD CONSTRAINT lineas_fac_codart_fkey FOREIGN KEY (codart) REFERENCES public.articulos(codart);
 K   ALTER TABLE ONLY public.lineas_fac DROP CONSTRAINT lineas_fac_codart_fkey;
       public          postgres    false    217    214    3197            �           2606    16582 !   lineas_fac lineas_fac_codfac_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lineas_fac
    ADD CONSTRAINT lineas_fac_codfac_fkey FOREIGN KEY (codfac) REFERENCES public.facturas(codfac);
 K   ALTER TABLE ONLY public.lineas_fac DROP CONSTRAINT lineas_fac_codfac_fkey;
       public          postgres    false    216    3201    217            �           2606    16587    pueblos pueblos_codpro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pueblos
    ADD CONSTRAINT pueblos_codpro_fkey FOREIGN KEY (codpro) REFERENCES public.provincias(codpro);
 E   ALTER TABLE ONLY public.pueblos DROP CONSTRAINT pueblos_codpro_fkey;
       public          postgres    false    219    218    3205            �           2606    16592 "   vendedores vendedores_codjefe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendedores
    ADD CONSTRAINT vendedores_codjefe_fkey FOREIGN KEY (codjefe) REFERENCES public.vendedores(codven);
 L   ALTER TABLE ONLY public.vendedores DROP CONSTRAINT vendedores_codjefe_fkey;
       public          postgres    false    220    220    3209            �           2606    16597 !   vendedores vendedores_codpue_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendedores
    ADD CONSTRAINT vendedores_codpue_fkey FOREIGN KEY (codpue) REFERENCES public.pueblos(codpue);
 K   ALTER TABLE ONLY public.vendedores DROP CONSTRAINT vendedores_codpue_fkey;
       public          postgres    false    220    3207    219                \  x��SKn�0]�O1��YƩ��]#��Ȇ�i�.%��M�]��X�V���J��g���5��j�
��8�7�{��A�\ p������:^K2<�s��bɾ�ύ>X���Z���Q�ب��%�I����b׭`�d"��u�G�������(�Ua�L���,)���L��HEw'����xR��� �E�����X���1���8?�xݘ
��֑Ƅs��l{�l�jv�W��vꑴ�������
�j�X_�*�XY���o/���z;+�שq��+	�d���)�`�ǁ��^���Ot?"m+����)�~���m���'�2/'�֋(~�|��(�-��7Dɡ,&�U��`�|P��gwR^�2li�dt��Ѫ����֭Uh���~Y�%%9TAM�mY�z�������/�"��.0�.a�Qrv�[�?����W$�������������?���ZRT(�����Ӫ�3�w7�E�*h��h�ܠL�E�"&�LP�ޣoaRZ!�H��)SV�/i5�;�'ߘ�<:Z�j9j�S z������Ґ�|��)H��S���8]U��.��fϘ6�      !   �  x�m��r�8��˧� q� ���x��G��T� $ba������H�.-_,Wg��N����9B��\�R�J���0����Cȸ��1,�I`�i	J(�+!4l���J��i�<,���.Bɾt=n����I-�R@+�1� ��.f�_N��t�ClC�.>�qh{��c(4\�%kH��/�����Nxя!%l�TzX=�;��wg4%�͒����#���O~"Q�/9�(w_����H��>�t6���Y�3�?J�v*e���x���πa��8u��Ӂ���:��m�](�vv5���?�.$X��n�0��7}W��7���/�6��nj���X)�����ۡ~�Ƙj+4~ X�8��P#h'ɷ��J��CLxQ�e�4�����v��2\��t�����t�%�����?���x��3A��~�M��d!��
o%w�����O�㶦���#H�n�S�����S�*�Ў���;�t�����u
c��I�m�J����p\kL'+'lb�����ɮ��9�X|�F��yjXg�c��a�¶�����)<>�]��L0���'��GzL��SUä����J�ޟ'��?}z�\�@���q���5H�2�V3W)����<�h��9D
�o���>Rn�(欪�r��S��Ho���m���.<�pK������?���e@j!x�W]U�w��7w      "   i  x�UTٱ#1���2[ġ$6���%�Y׸�rh��E'�w�2�h�������QIt��� � ���Fb�1�g��a��ld�0��N�b�x�t�����`b�4@|�ǭa<��3~�y��Y�F�@�iW`Y�2�џ�ش��z��ά��Ib��`��6<�m�ϩ��1�5rR	���t5�Oŭ�5�q����7bP�b�E�i�@��Իxag`��,ʻ�zQ~Q�v�z��vo>����lS;��K�ul��XEUѕl%�&WVMnN�e��4�L�7mI���Eו�bc���k�V��16��&�eV�Y}`�VB�e�Zȳ���������8��i]�����^ԜMH�	ީtM�H`��?�NWֆ��__�����ܶ�U�|�g܎"�no��m:�����*D߸��^v���,>&sߊ��n�L��5u,I�����؞����viy�
���W��j4��l�g毖��f�E��.�Y�B��74��k�r��:D�K2u���*����vM��~��!�'���5�ך�P���mX��
���Ī�����=	�'{~�9�z0�}�G�3���|n~���V-n:��k�A1��x�x�ϟ�y���      #   �
  x�UYˎ �<�|��)�k���b�,� �����U���z��%�,V5��=�����󓓔����jo~H�gj퉧x�S�<��Z����)��Ϗ�>�^�(�q���\�������9���mԜ�.����UKY��5�X:O���˿k~&��X�b>���[���O���"Y�i���Y���^�S���|f��>���羭=�u������%>�&��GE����ұY���uFG����[D%�
���򟭨��OO���e����������7�"����a�)b��P+�K���Վb���9���)H=���J���W�@\�AOM��Ӗ�ժ�u��XA�^#��¶����s�U�Be)���L�1�V&�d�%R(��慇��%��|����N���,y�t��rHL�3j�%�E�Ϻ�6�a�i?Q�Όa�����,��O�h��2������OE����~��/;�*�Ԋ��e"�+��&����2��#=!�
����Hc�eI8��76�oV�	렶�d�����X濖$@k�-+�F�U��������Ӕ;߈!������ܶ����մ�	�����H_�T|1�\0>U1������/K��j1�J�j+�Y�xNӯT�po�:^t���}vvV$�RS����R�Ө�:P�� ���T�J?�0_.���a[3��q[�'�:�Xh@;^�����~����b��l5��m��>lb%GmU4"0�t	x����m?MB<ʲr�0��X--&�g<Н�r��b�-/��� _E�#<�0����y�>vZ�㨤+��e���V��d>"Ʒ�Rb;/��wtNcx�Fͧ�J�ւ���L�`�YY�B��B�$�j � ]o[*�v�M&*�����A��,|� �W}[>HP�5�$U�H�?msC!�O�dl�clZptr�3ۮ7��q���
v�)�qXp�nƱ��-��-�=��ǵ��֥
m{1�Z�Id!��R���z�mC��IS�Q)�3���i�2ˋ��泸'|ǽB��2d�F�9��5m�> ivVf��S��@P���D�'g���r�iu%�R���8ɑ��:Piq���R�N���G�p��;[g3Oefk�ch�&|��6��L���qĻa�������T��� �L.��]���2���(r���n�50#B*�p��2�����հ8�(��9!�Dv~@)NJ;x�aNwXa(��X&l�Al�;2��#0I�-�u��D��k'�^N��Jዊ�l�.�j�I
*�U����A�n��ZG�S`	=K|dBQH(��F�%�^0�o�@�sG��/x�|{��B�[��M�}y)0	�C���t_<�P�#���0}^kv=6�g�к�Ǭ��r}<�)�
��W-����]��Q�Y)/'{w[��|*bow�|�_{d �BqB��X�ڻ�v���M�����m�7^i���~��D�i��K����:�9Xq�7��,��ѡɌ�J�?iŢ�/(���O0��3�t}}P�E��۫�?$zޏN,4�8����r�K>�<Q>��b�B�=Ě�������Xs������ɺ%Xo�"�yX�)�BXlw�� ��
L3/@nlN!,������D �7<UOJwC	�7<ꇻ��'�uznmB�q���Γ�N��ô܄���������x�y�ZZ6X�dtJ���Sv�F�yƮQ��!Ѱ��h�-$�>ǹPCh�>
��`{y�c�����^��8��i��*�s�J5�G,���)�^������UFUJ���E<D�Yt���$���q���{����t_`L��/�E���g��I��D�D�l�vݐ�>j�;���E��]�_(m��m���	i��=�YC�z(o����y��&�.�z����݉l��S��K�"�0�P*�[7ޣ���b��iO�z�MR���)Dʁ =�(ףR}dc�{�=[!��<�� � #o$Jk)�b�=�-�3�;1fdo,w�ZX���>^���-�A`�{����-r��ut�H���*�1��}e��4%ܧ_-���8�Bܯ��Xe���������]T�y�a�$c�S��P~����w��r3��S�}�}�B��D���'����s���/�.I۷( tq�O�ܸ�r^F�E�y���:Sk_�m��k�� A�n��u���c���,U��@s��O�|�{{�˫�Iْވ��y4��X<&~���Q�-=���j���U��Y�X��u�w��0K�j�֜K-��pU�^7�.��}����78�?������M�gg�V�i��"Ð6�R��W���M�M����7�<�H�qV����&Gt��Y�v�������9���E)�_�t3�S���~ ������p;���r�b7����m��zk�C��匫��`�Nw��^x�.c��K����q��⢋�&Z���wMb��՛��b@��U��|����.��$UӸu���3Ղ=Ic��� ��C�áGݐ�M\3ɦ4os�&��քWd���| ��I����.4�V�����]��Jh�M��/�
#�j;�J�������I�w<�B�w��8aE0Z/H;��m��Ę��6��,��H;��0e\�Mj�m���eF��cg|vv�q�[�8����3��W����?�8�      $   �   x�5�K
�@D�ݧ�(f�Yj�֕�"��m!3Yx.������UmJڪ�����#���~W5���FwENt�'��b�Y�WtT��2�9r�Q��/&	���nڟ[T�V�7��+�״_��pUҀi��ۆȯ��e���2�      %   4  x�-U˒5]�_�?`ʭgk���Hf�a�J�(6r�ƭ�,�%���*aIA�����Y�-�{�y\m�њ�-��k���bcٹ�f��T��NY�$wȧSR��6'���VBY�ކ��ŻX?�M�B9���3���(#ė���7�8&�J��1�,OS����YkWъ�=i�%2�W�H�إ���!S���N���ͳC�! �mW��:ήJ�17�\ٻ3ui��pv}ߗ|3S�Mg1åO.4g%{Ϥ�W- ƻ>��&�8t�7�e���$��]��?:�f�0��ui�~�P�:?M�W.��t�X�����1za\���������-W�ڧ�Z���%��|�V���\<4��5��0�e�����|�6vh{����&�!:�(*�k��z�}ВDن>�PE��\��5��L�!({
�ܜ��/�ŹR �E�2#�a�[q�Q�=Y�>����e/��?�?D�r۲�K�C�95J)K�����j4D�2���X�M��+�ѕ[R�՘�=�e>,i�'x�[�u!�kh뗞@r.�e/��>��6/|�O*n�v�ć/dr�I���.�{Ox�����x���BDӱ�{��f��+`���Eˎ?�����Pf�"A���:��@�+?�y�f0�e���W�[�bttH�S_��4�B۶FKp���ʗy��I�-�֧�y��Xvӑ�ː�]m�!<��]+L������Z��l�
�o=���UM)??�������ì�5@�Ⱦ���>�)�'��i�ݯ��<fJ[�������T����j�A���0_O6h�3<rOŴ2<��)Wjn����a#�WJ������7'h0��t��,/Ӵ��X�s��K9�ӆF��ᾦ���C@\m�5�}R��W�Zn�3F��
�l�_B)�8o����a�3������ �u򴤈J%@�U�O����n�Vj�v��3y��Z�(%W=U����4��l�
�T�Z+Z����k��u����ۓ����\������c��a���eHuc����З����5m��@6��`F�nI���	zHZ��������h¶w��~r��ӢE�k�LD�ƴ��2�B��wk�d/�]�>Tt�o�>�kCG����x�l�)����щ���k�!j���i�=�	�	��4��r��ZP��f��!�����җ�R���.��e ��=��w�sX,��K�����5��D�R�G��@ή���`�gH`Ƀ��\
%���҇��׆�L���ik�6�D�yDCnb���i��kKx����n}A�"��w_�V���*2�      &   �   x�-��N�0���y��i��#�Q���.^��,AIw�7��}�Y�����Ɩ`�_���c�F������q��d�m�B@c���:��B"؞����Sn�c�S�{���%.��5}G1Ȋ`��䀔�n�uֻP�(�s.���+x=�嗧s���I��u���<�C��O�o!ri�g���Y��?e/�ґ��;lI�o�RWM�H�     