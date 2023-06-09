PGDMP     /                     {         	   Sportshop    15.1    15.1 5    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    16681 	   Sportshop    DATABASE        CREATE DATABASE "Sportshop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Sportshop";
                postgres    false            �            1259    16683    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16682    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    215            9           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    214            �            1259    16690    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    16689    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    217            :           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    216            �            1259    16697    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16696    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    219            ;           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    218            �            1259    16704    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    16703    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    221            <           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    220            �            1259    16713    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16723    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    16722    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    225            =           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    224            �            1259    16712    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    223            >           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    222            ~           2604    16686    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                       2604    16693    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16700 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    16707 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    16716 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    16726    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            (          0    16683    category 
   TABLE DATA                 public          postgres    false    215   �9       *          0    16690    image 
   TABLE DATA                 public          postgres    false    217   :       ,          0    16697    orders 
   TABLE DATA                 public          postgres    false    219   �?       .          0    16704    person 
   TABLE DATA                 public          postgres    false    221   B       0          0    16713    product 
   TABLE DATA                 public          postgres    false    223   (C       2          0    16723    product_cart 
   TABLE DATA                 public          postgres    false    225   �V       ?           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 6, true);
          public          postgres    false    214            @           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 80, true);
          public          postgres    false    216            A           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 9, true);
          public          postgres    false    218            B           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 3, true);
          public          postgres    false    220            C           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 31, true);
          public          postgres    false    224            D           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 16, true);
          public          postgres    false    222            �           2606    16688    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    215            �           2606    16695    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    217            �           2606    16702    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    219            �           2606    16711    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    221            �           2606    16728    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    225            �           2606    16721    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    223            �           2606    16730 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    223            �           2606    16736 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    219    221    3212            �           2606    16746 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    223    3206    215            �           2606    16741 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    3214    219    223            �           2606    16731 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    217    3214    223            �           2606    16756 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    225    223    3214            �           2606    16751 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    221    225    3212            (   �   x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP���bÅ��^�paۅ�.v�kZsy�f�)Ƞ��_�4����U(�(���qa+&��L^6d/�y� #�� J_C      *   �  x���M������+�&	6��̬�Lt�A�#�%�*�S����X��Q����~�9�3U�_~�釿�|�����}����>��o��۷���m���~�g�}}�}�����?����n�ӟ���O�o���+.=7�H�<�E��f��)�-�����|��w���
�����l�=��&��fL�9�{�i��x��E�Uh:��Md�α�}�9s��y�~�U�B�Y���A��tM�'�"���=�L�Z���*tN`�׊�)��H�U����y�b����ҹ��e�|��6�L�u���ąr���(��z�K^F2��-�%�L��.+��h�.U%F�6�r��/���l�{�F�������)���F�u�&��3k���`���f��p"�Q��0g�E��5��C��|ݹ�kK2�<���.8w���(6r�{��%�2��0���V�%��ᛢL%��)s<4�/#���R�꡴��&��Z�`��K�ʶ0R�$�旱�.�Xt�	E���Λ�8L���X�$���:��X��k�M�
;�x�(,m��Uv<ٗ���6V�xc�1��<so:�*�/�+�6����.c�6Ҩ�{�܂�[��P�io�������Ʋ
�$�	��2�ĝlud��Y��^�h��}lL�>3�Li��f��+-�6�H��.|��XӬ^I��U*N̀�s]�O�\�>6��0L��̌��-w	|C'*�;:��D��.qݝߛت}�]�����\�m�dw�қ�Cb�2�umܚQт�P��ќ��R�n�o�ٴ��e��b<��5��@Zm��2��Y|e\�I�v���њ^�hyF)��{.����˓]�b�q�=��=�	m�oQ�Y�[�Y*�7�����Gb�pc�!*��{������bu6������#���l2�v��H��Q�2��s¨��V�5��e�#���Sy{i�f�Z �s̭f��~�A��w����8膉�<s,d�<l���Gb�sbd$F�VN��kb�(�?�!ױ�}�Β�Q��+�6�k����R�@�������w���er�^R*}f<��TE.#��P7�S<u�[�-p�'_.3�r��|BR`���X��è�l��c��Im��_F>�R���ہ�z�{�h�Hj����2���8�a7������9�^�Wӵ��i�W;�J�&�b�]�K�Ա/X(:g��m:g��"�����X�p�H�lgwn�d�ч2�N�-#q�~�XRQ*�4^GH��R�C�g�H���u�#�Xh�e|UK-6Y�\��>���#���^��n�+ve�@�|����]haݱ<���:{��գ���؟hDE2+2*6Kwo�'�>b�z���v��Xi�n���E+�;������u�34n��}tegdE.�<8o/ғx~��u����]b7�g�t�*�Rm�lb��|��w��O�w�H      ,     x���Mk�0�{~�nI�c4�I�z�a��Ф�}�l؏�_y��.�^|��%��}��<>=|y6��������o˸�׶?��mLٝގ����^���6���kn���﷥���x:�Ӿd����y���������ׇ's����u�Xt�ʄ8YQ{��W}`��4 �x�T$��Mf����ϻ�=����f�C@��������$L.��!�[��� ��AJ��R���,�~��x�A�3��獥��D4Z�ji1$
s#qPH��VLPIf�k��l���z�F�8��d��3-�b�=ϽI��`{*�b���s��&a�!�G��B�4���\j-�J�\����&�����Z�Ҥ.�	i=C�j���14��C7�<p��K�cm�Ph�2�A�Ŀ<����]<ϳ�ɣ�B�8��� k$_S��KK����C�?�X�09���yr��f%��/!��߿�)U��r�A���O����^�      .     x���Ko�@ ໿b$jb�]-��d* >@Y�K�c�[�E~�4i��M&�ɧX�l��	�*<ш�IQ�h<'��l�,o�节������`0�#��f�.p(����RkSrE����7T=��_.|��aMp�*j9KrIo� x�89����V>g�n�o=�)���������[��
~tD�'�W�\�FM�Z��׵F�tϷ{A��о�0��<���Ѓ�^Z�*G�*E���5W�H�Xm�($��/icG���X�TJ��^���p      0      x��[�nWr��w8�K@�x~8�A.����H�%'ٽY��E����;�#�TD��։7޵��"��h�Lsz�����
y�T}U����IF �H���O�������z�����2W�ߺa>y�Ὥ;�Ov��>��k.o���ۻ�����x�>n>����������|��u��{�y���N`v�v�џ�z{g����z�w~�뭻W�߿y탷o�˫�y��h�k�N��2���Fkc�Uow�Z+���j�y���4̎�y�cC����L���QzA��l�з�Ity���I��>Mq3�f�u�~F�M�-N#���4��h4!��Ӊܔ����	�8��t��eOiFz2��X��G?I��S�?���a�٩�B#;Ȟ�(S^d�Z_��oi�K��V���E;�%]{�oj4VL˺�g#����gx��~"��/����-k��if|o���4�_�-F���#	��FWi����Oxv#ҡ[�XV������Y�bĬ�]o�	<K>�[�4�����E�>λ�Ѳ�vg�Y�4{F#��xF7�9�0©�C�O���s�EF��i��O�daN�Q����H�B�s��L2S!%�B�sR��fһC}������4$�<���T&�nU�8H�`���}
�၇<
���r����K'4�Wb���b9bȡ`|l^rJ#Ȟ�R��ef',�0�ޟa=͎�Ǵ@YƑ���Nk�Þ�Q����G��G�#�VL��<Ǵ����g01�Ž����l���W6L���W��V�W0�.�5ֺ�N��o�}�N?���p�S��"��>�G�e�q`3S��,~6c2���;�$�Ր\��+u�ꏊ߭�notZ�F}��Xia������q`���B��XN��W�1���ۿd'b1b�q:͟^�YCh������ւϠ&����7����<$�Ʒ��X���O�� �'����'5`c��cp���Ӕ�PoVV��S2l�o���	�k�>��!�<S��YXZ��l(�R��eӣ�	�y�Ǭ���
�aK95�1�1���1���8���@p>�
�X?�.b7 ���'�cg��ĩ2(��Ȑ�-��8�M��6dDG���zB�ENY�}z���i]�ɲ��L3X�_��Ά��,r�k/~���11���C7�VX��p��;n6ޞJ{^��Z���΋6�	V_��v��6Dv�\m����ݼ~v�M���, f��NГc�o�wlj'$�7�:�KZ]��q�8��f�gK����N�Ώ�K�2.�lt��J{}��������1S���pΪ#�1'��^}�D��cX�ul�6��3	>,:��P��D��K�78=fG̡H&�	�0-RW3���T_d��GL ː��n�9
�SH0!���g���]����;��Z�z�`dnq����੢g���C
�0��k^\��)�JQ�$0���Q6��h���&�%�u�*>�$��3�����C8{��<C�o�Å[���hSt n}�#�{�P<!�ܾ�H��/��$)OH,#��;�vL!�ʩ!�/���+V�o�+��|	'�핢�j��9�[\�sgo� �s��)��\̍FcI4�?Ź�
E
�?d���D�S$I��͏�
�j>)P!����zM}�a�z�HcE)��m�Lf���y�Χ�G�8H_
 ���m�B�!�0�,q���
"� ��8Id)�Z�[�B����X�}��`�� v�LB�iVD�D��1;����U_�?����F��JF������۟�n�m���~���W2ۛ�?%�R��k+����Zwu��s)�!@c����Rʿ�ڽ����7��[�>+��x��͡L���24��(��@6���b���=�IćVK�֛��q
��8�q��:�*aaC��<�4fBY{)����~���
/%�l�s����4����y*,�:}K"A�I�=��$�5yX�*-�fOi����Qn�7���� �g����MW��5��ٱ�DF�l;�}���B�YR�*�Q �=�z�<�)辯*<�؋��K��S��V�PG���:�	=�h(�(];!L2��|3@��"^T�H�$�XD^	.��Q3M`j-��B6�bItq��,'Q��HFb�'�D��̯N�ߦ/^@��0P�A�߼v�Kd��Â����R�J8@W��Y��q KsYcaZ3ig�k9����W����q�Ǎ�H �CD0(�;E�J��!;��u�L�76���v�R)��������3aSl�j��\�b�G����ڽ}������Ms��27�5o����U�LT�F�3s98�(vRL�Y�����k��hK��s�/�c�"W��G�B !��J��9�M��Ӆt�P�1�"肞�A�Qy�=��!ǊF��c�#6��n,f<���<��\����;���d8��/�89�:wD��Ŏ�E�����K�m��\��|�}߼}o��.)�.'?�uf��ux���h��ĭ}��s��mر�Լ̶/�B�#��3�5q�����}�\3	p��Ѕt>H]Bp��!D��(T��@���΂TI8�?a3K�熔���f`�B�l���g�j��@X��yJ���ͯ����Za�6uU�c�g�F��Hmю��ǐ=�K��R��O]aaOt���'2qqT�'�~���%����*Z�O%�I�e&sR,WY��S���溜�ƛ.M�'%2��^�p�GO�}�c���T�f����,֧lh�=��b�������[!	�WJd���v�s+;)���V�Q�y#���4�?rd����<�(��l�l�;�l����f�g�w�nN����ؕ\���nn$��6��1 E�R)���gٱ�h�""�!y$�8�s|�����+5bX"�A�M�~��2�'��.��<����Ѻ�}e�;(hƪ�b���$��z����v6wwkn�n�l"R��E����;(V��9٢��$�t]?�k����Z���Z�Ց�K�{�U�~=R]�,�2�� ±�c�Xc7k�T3��ci���v5i�*��(;83�qǥ֌H��o͐��˔?E��fݹ@꣑��h�C�P��3�N��S]6<ΡW�A�5m�����yϏIأ�-"��x��7h��7�躦�Bv�F�28Q-�-�敔�m!^I2����p�9ƀ24kȢ���d�.�����J)t��5��9�"&b-�,��eb���Hߔ7�wiD�`X�=G�
� ��]�e| ���S_��8Jx!��R�S����J���I�Ȳ�K�BȁG򠣣�2 7Ѽv	�	�<u�;�ߗ�ĮAJ]O�Ո������y0	�g���+Tp����i?��� ��y���A�s��9��h6ך�F7~u�:G�	��6���Λ����_�w�5�&�*1i^�fڒ����3�����(��h��;��ݵ6�����)�b��עE1�F������$���`�B\Ȍ�SmC3�Ɛ�taue�jc�����o,d�	�ߢ%�r�]�&�Au���Tf���� ����~���I�hI6��R�w�ȧ7����f�L�����cǱ%R�՛7��f��Ů�# l��g��GVv]��l�����O�p����;b�UZ�`�^�پi՘��p=Jń��\�6؆_��f���W�W���x�9E���QKZ�6L��kM�g�&L������'�y��*�a�䒯���A���6Ej(�s(\eA��@8y��IK�T�[b˸n%��������������]�`��۞�̏��y��g]"�G���(�Z�m!8��K�ڇ̛`���	�O�?���\Y)�"�U���Ɩ�6J�<� �[I�c���ckҼș.���)����|&G�]aEm$++��C$kP*k���@� @��|u��*�!����{����h����2��l��r��˱m�1��@�-� -z~�r�?��k�s��kפa�o�,r�{^��KxQ+�$ �  ����9��auE0ԧ�F#����Cz�{��~q�U���bЌ���YZ��؋�
p)!Z�4º�pc;b��y��B� ���jV�\Pa�0���on����oDh�̧^�n@2e��Oa�ёa	Գ+
m���ؽV��1��A�YP��jO���|�����HHQռ� :�nW�Վ� ��-��^�����Mș�|K-����sY˙�U�Y�ZA�N���[���Kbw/��ݯt��Z#��aSM�[���ޡ9h��-Һ��JĴ��\+�/D'�H�H�	�:�'��6Mjj�=���bV��A�d�����z�M+�@���f���`�ǐ�7�<
-��y�"����T�����x	"h�ŏ��»_H�L՛�%y����i�b�����E�6� =������O5̛�2;q�:N�]�Z��/\ܒ=F�6I����,l\`2�
��|/�b�.����p�� ��F��J��A�#f��e%}�Zy��*����+/����]��^/�T B��K� ����X�i�rԗ��UvI�*��N�^7o}�y�W[wno���e�j�ө�������Zs��K���8�;Ҥǲ_js�����m��֚i47��F���XYS����e��Y�l���$�+�"*Su�C�@��r�0�`�xv7u���Or[|AJ�/���\a⺬8Tc ��|��
°%8(���J�:TwW)*�nG�3�>��9�\�{R�:��Qm��P� .@�$X�����i��S�v�>]�#��@rr��$%Ɣw��b�Y�/�s�o��鋫����hYw���֘�::JS�B��j/� _�lI��V�Y
����x6L�ӰmI�E� H��;��ZFھ�W����iC����w78�)Յ
��B}�MNhQg�/]��3
I�U`)j$���إK�ذ�Q      2   
   x���         