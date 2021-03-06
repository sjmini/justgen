Caml1999M025����            4src/solver/driver.ml����  Gx  g  :  8������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����o�@�@@@@�@@@�@����������"Z3��4src/solver/driver.mlA@E�A@G@�@@A��A@@@@�@���������(SlangAST$Node��BHM�BHZ@�@@A��BHH@@�@���@�����%check��#D\`�$D\e@�@@@��@@���&solver��-D\f�.D\l@�@@@���������&Solver%check��<Eow�=Eo C@�@@@��@����&solver��GEo D�HEo J@�@@@��@����"[]��REo K�SEo M@@�@@@@�@@@������-UNSATISFIABLE��^F S W�_F S d@@�@@@@����$None��gF S h�hF S l@@�@@@������'UNKNOWN��rG m q�sG m x@@�@@@@������(failwith��}G m |�~G m �@�@@@��@���5solver status unknown@���G m ���G m �@@@@�@@@������+SATISFIABLE���H � ���H � �@@�@@@@���������&Solver)get_model���I � ���I � �@�@@@��@����&solver���I � ���I � �@�@@@@�@@@������$Some���J � ���J � �@����%model���J � ���J � �@�@@@�@@@@����$Some���J � ���J � �@��������.Counterexample&create���J � ���J �@�@@@��@����%model���J ���J �@�@@@@���J � ���J �@��@@@�!@@@������$None���K��K@@�@@@@������(failwith���K"��K*@�@@@��@���0cannot get model@��K+�	K=@@@@�@@@@��I � ��L>E@@@@��Eoq@@@��A@@@��D\\@@�@���@�����0encode_and_check��NGK�NG[@�@@@��@@���'mapping��(NG\�)NGc@�@@@��@@���(preconds��2NGd�3NGl@�@@@��@@���$rule��<NGm�=NGq@�@@@��@�����&solver��HOtz�IOt�@�@@@�������&Solver)mk_solver��UOt��VOt�@�@@@��@�����)Constants#ctx��bOt��cOt�@�@@@��@����$None��mOt��nOt�@@�@@@@�@@@@��rOtv@@��@�����,encoded_rule��|Q���}Q��@�@@@�������$Rule&encode���Q����Q��@�@@@��@����'mapping���Q����Q��@�@@@��@����(preconds���Q����Q��@�@@@��@�����)Constants#ctx���Q����Q��@�@@@��@����$rule���Q����Q��@�@@@@�2@@@@���Q��@@�  �������&Solver#add���R����R��@�@@@��@����&solver���R� ��R�@�@@@��@����,encoded_rule���R���R�@�@@@@�@@@��A�����$loop���VZd��VZh@�@@@��@@���#acc���VZi��VZl@�@@@��������%check��Woy�Wo~@�@@@��@����&solver��Wo�Wo�@�@@@@�@@@������$Some��X���X��@����"cx��"X���#X��@�@@@�@@@@��@�����*fun_unspec��/Y���0Y��@�@@@�������.Counterexample-to_fun_unspec��<Y���=Y��@�@@@��@����'mapping��GY���HY��@�@@@��@����$rule��RY���SY��@�@@@��@����"cx��]Y���^Y��@�@@@@�%@@@@��bY��@@�  �������&Solver#add��oZ���pZ��@�@@@��@����&solver��zZ���{Z��@�@@@��@����"::���Z����Z�#A�����������.Counterexample&encode���Z�@�@@@��@�����)Constants#ctx���Z���Z�@�@@@��@����"cx���Z� ��Z�"@�@@@@�+@@@�����"[]�
1A@�2A@@@�43A@@���Z��5@@@@�M6@@@������$loop���[%+��[%/@�@@@��@����"::���[%<��[%>@��������*fun_unspec���[%1��[%;@�@@@�����#acc���[%?��[%B@�@@@@�A@@���[%0��[%C@��@@@@�+@@@��@@@��@@@������$None���\DJ��\DN@@�@@@@����#acc��\DR�\DU@�@@@@��Wos@@@�A@@@��	VZ\@@��@�����+fun_unspecs��^Z`�^Zk@�@@@������$loop��^Zn�^Zr@�@@@��@����װ�(^Zs�)^Zu@@�@@@@�@@@@��-^Z\@@����+fun_unspecs��4_y{�5_y�@�@@@�@@@�0@@@�q@@@�@@@��@@@�A@@�	A@@�
A@@@��@NGG@@�@���@�����6split_encode_and_check��La���Ma��@�@@@��@@���'mapping��Va���Wa��@�@@@��@@���(preconds��`a���aa��@�@@@��@@���$rule��ja���ka��@�@@@��@�����*split_rule��vb���wb��@�@@@�������$Rule%split���b����b��@�@@@��@����$rule���b����b��@�@@@@�@@@@���b��@@��@�����1split_fun_unspecs���d����d��@�@@@�������$List#map���d����d�@�@@@��@������0encode_and_check���d���d�@�@@@��@����'mapping���d���d�@�@@@��@����(preconds���d���d�'@�@@@@���d���d�(@��@@@��@����*split_rule���d�)��d�3@�@@@@�7@@@@���d��@@��@�����+fun_unspecs���f8>��f8I@�@@@�������$List&concat���f8L��f8W@�@@@��@����1split_fun_unspecs��f8X�f8i@�@@@@�@@@@��	f8:@@��@��������1fun_type_fun_name��hnu�hn�@�@@@����4fun_type_param_types��hn�� hn�@�@@@@��#hnt�$hn�@��@@@���������$Rule,get_fun_type��3i���4i��@�@@@��@����$rule��>i���?i��@�@@@@�@@@������'FunType��Jj���Kj��@�����@��Rj���Sj��@@@�����'FunName��[j���\j��@�������(fun_name��fj���gj��@�@@@��@��lj���mj��@@@@��oj���pj��@��@@@�@@@�����-ParamTypeList��{j���|j��@�������+param_types���j����j�
@�@@@��@���j���j�@@@@���j����j�@��@@@�@@@��@���j���j�@@@@���j����j�@��L@@@�U@@@@�������(fun_name���j���j�@�@@@�����+param_types���j�!��j�,@�@@@@���j���j�-@��@@@���@���k.4��k.5@@@@������(failwith���k.9��k.A@�@@@��@���)wrong AST@���k.B��k.M@@@@�@@@@���i��@@@@���hnp@@��@�����*num_params���lQW��lQa@�@@@�������$List&length���lQd��lQo@�@@@��@����4fun_type_param_types���lQp��lQ�@�@@@@�@@@@���lQS@@��@�����%embed��	m���
m��@�@@@��@@���*fun_unspec��m���m��@�@@@������*fun_unspec��n���n��@�@@@������)FunUnSpec��)o���*o��@�������+return_type��4o���5o��@�@@@�����'FunName��>o���?o��@�������(fun_name��Io���Jo��@�@@@��@��Oo���Po��@@@@��Ro���So��@��@@@�@@@�����-ParamTypeList��^o���_o��@�������+param_types��io���jo�
@�@@@��@��oo��po�@@@@��ro���so�@��@@@�@@@����"sp��}o��~o�@�@@@@���o����o�@��Q@@@�]@@@@��@�����8param_indexes_to_replace���p!��p9@�@@@���������&String-split_on_char���q<J��q<^@�@@@��@��� _���q<_��q<b@@@��@����(fun_name���q<c��q<k@�@@@@�@@@������"::���rq}��rq@�����@���rq{��rq|@@@��������rq���rq�@�����@���rq���rq�@@@����*index_strs���rq���rq�@�@@@@�A@@�@@@@�A@@�@@@@�������$List#map���rq���rq�@�@@@��@����-int_of_string���rq���rq�@�@@@��@����*index_strs��rq��rq�@�@@@@�@@@���@��s���s��@@@@������(failwith��s���s��@�@@@��@���9wrong split rule fun name@�� s���!s��@@@@�@@@@��$q<D@@@@��&p@@��A�����3get_new_param_types��0t���1t�@�@@@��@@���!i��:t��;t�@�@@@��@@���#pts��Dt��Et�@�@@@��@@���'new_pts��Nt��Ot�@�@@@��������">=��[u+�\u-@�@@@��@����!i��fu)�gu*@�@@@��@����*num_params��qu.�ru8@�@@@@�@@@�������$List#rev��v>H��v>P@�@@@��@����'new_pts���v>Q��v>X@�@@@@�@@@����������$List#mem���wYi��wYq@�@@@��@����!i���wYr��wYs@�@@@��@����8param_indexes_to_replace���wYt��wY�@�@@@@�@@@������#pts���x����x��@�@@@���������y����y��@�������"pt���y����y��@�@@@����"tl���y����y��@�@@@@�A@@�@@@@������3get_new_param_types���y����y��@�@@@��@������!+���y����y��@�@@@��@����!i�� y���y��@�@@@��@���!1@��
y���y��@@@@��y���y��@��@@@��@����"tl��y���y��@�@@@��@����U��#y���$y��@��������"pt��/y���0y��@�@@@�����'new_pts��9y���:y��@�@@@@�A@@��>y���?y��@��@@@@�[@@@���@��Gz���Hz��@@@@������(failwith��Qz��Rz�@�@@@��@���;wrong split rule fun unspec@��[z��\z�)@@@@�@@@@��_x��@@@�������3get_new_param_types��i|7A�j|7T@�@@@��@���������u|7X�v|7Y@�@@@��@����!i���|7V��|7W@�@@@��@���!1@���|7Z��|7[@@@@���|7U��|7\@��@@@��@����#pts���|7]��|7`@�@@@��@����հ��|7���|7�@�����������$List#nth���|7c��|7k@�@@@��@����4fun_type_param_types���|7l��|7�@�@@@��@����!i���|7���|7�@�@@@@���|7b��|7�@��@@@�����'new_pts���|7���|7�@�@@@@�A@@���|7a��|7�@��@@@@�y@@@���wYf@@@���u&@@@��	A@@��
A@@��A@@@���t��@@��@�����/new_param_types���}����}��@�@@@������3get_new_param_types���}��� }��@�@@@��@���!0@��	}���
}��@@@��@����+param_types��}���}��@�@@@��@����̰�}���}��@@�@@@@�"@@@@��"}��@@����)FunUnSpec��)~���*~��@��������+return_type��5~���6~��@�@@@�����'FunName��?~���@~��@��������1fun_type_fun_name��K~���L~�	@�@@@�����"sp��U~�	�V~�	@�@@@@��Y~���Z~�	@��@@@�@@@�����-ParamTypeList��e~�	�f~�	#@��������/new_param_types��q~�	%�r~�	4@�@@@�����"sp��{~�	6�|~�	8@�@@@@��~�	$��~�	9@��@@@�@@@�����"sp���~�	;��~�	=@�@@@@���~����~�	>@��^@@@�k@@@�s@@@��@@@�q@@@���@���	?	E��	?	F@@@@������(failwith���	?	J��	?	R@�@@@��@���)wrong AST@���	?	S��	?	^@@@@�@@@@���n��@@@��A@@@���m��@@�������$List#map��� A	e	g�� A	e	o@�@@@��@����%embed��� A	e	p�� A	e	u@�@@@��@����+fun_unspecs��� A	e	v�� A	e	�@�@@@@�@@@�&@@@��@@@�@@@��@@@��@@@�N	@@@�x
A@@��A@@��A@@@���a��@@�@���@�����#run��� C	�	��� C	�	�@�@@@��@@���'mapping��� C	�	��� C	�	�@�@@@��@@���(preconds��	 C	�	��	 C	�	�@�@@@��@@���%rules��	 C	�	��	 C	�	�@�@@@��@�����)num_rules��	 D	�	��	 D	�	�@�@@@�������$List&length��	( D	�	��	) D	�	�@�@@@��@����%rules��	3 D	�	��	4 D	�	�@�@@@@�@@@@��	8 D	�	�@@�  �������&Printf'eprintf��	E F	�	��	F F	�	�@�@@@��@���<[Running on %d processes...]@��	O F	�	��	P F	�	�@@@��@�����)Constants&ncores��	[ F	�	��	\ F	�
@�@@@@�@@@�  ������-prerr_newline��	i G

�	j G

@�@@@��@����"()��	t G

 �	u G

"@@�@@@@�@@@��@�����(run_rule��	� I
%
+�	� I
%
3@�@@@��@@���!i��	� I
%
4�	� I
%
5@�@@@��@@���$rule��	� I
%
6�	� I
%
:@�@@@��@�����(fun_name��	� J
=
E�	� J
=
M@�@@@�������$Rule,get_fun_name��	� J
=
P�	� J
=
a@�@@@��@����$rule��	� J
=
b�	� J
=
f@�@@@@�@@@@��	� J
=
A@@�  �������&Printf'eprintf��	� L
k
o�	� L
k
}@�@@@��@���	#[Process %d: Running %s (%d/%d)...]@��	� L
k
~�	� L
k
�@@@��@�������&Parmap(get_rank��	� L
k
��	� L
k
�@�@@@��@����z��	� L
k
��	� L
k
�@@�@@@@��	� L
k
��	� L
k
�@��@@@��@����(fun_name��	� L
k
��	� L
k
�@�@@@��@��������
	 L
k
��

 L
k
�@�@@@��@����!i��
 L
k
��
 L
k
�@�@@@��@���!1@��
 L
k
��
 L
k
�@@@@��
! L
k
��
" L
k
�@��@@@��@����)num_rules��
- L
k
��
. L
k
�@�@@@@�f@@@�  ������-prerr_newline��
; M
�
��
< M
�
�@�@@@��@����Ұ�
E M
�
��
F M
�
�@@�@@@@�@@@��@�����+fun_unspecs��
R T���
S T��@�@@@������6split_encode_and_check��
] T���
^ T��@�@@@��@����'mapping��
h T���
i T��@�@@@��@����(preconds��
s T���
t T��@�@@@��@����$rule��
~ T���
 T��@�@@@@�%@@@@��
� T��@@�  �������&Printf'eprintf��
� V��
� V�@�@@@��@���	7[Process %d: %s (%d/%d) done! Found %d counterexamples]@��
� V��
� V�J@@@��@�������&Parmap(get_rank��
� WKR�
� WKa@�@@@��@����?��
� WKb�
� WKd@@�@@@@��
� WKQ�
� WKe@��@@@��@����(fun_name��
� Xfl�
� Xft@�@@@��@������ڰ�
� Yu~�
� Yu@�@@@��@����!i��
� Yu|�
� Yu}@�@@@��@���!1@��
� Yu��
� Yu�@@@@��
� Yu{�
� Yu�@��@@@��@����)num_rules��
� Z���
� Z��@�@@@��@�������$List&length�� [��� [��@�@@@��@����+fun_unspecs�� [��� [��@�@@@@�� [��� [��@��@@@@��@@@�  ������-prerr_newline�� \���  \��@�@@@��@�������) \���* \��@@�@@@@�@@@���������C��7 ^���8 ^��@�@@@��@����!i��B ^���C ^��@�@@@��@���!1@��L ^���M ^��@@@@�@@@�����+fun_unspecs��V ^���W ^��@�@@@@��Z ^���[ ^��@��@@@�@@@@��@@@��@@@�'@@@��@@@��	@@@��
A@@��A@@@��g I
%
'@@��@�����-rules_unspecs��q `���r `�@�@@@������"|>��| c���} c��@�@@@��@������"|>��� bim�� bio@�@@@��@�������&Parmap'parmapi��� a�� a@�@@@���&ncores�����)Constants&ncores��� a�� a/@�@@@���)chunksize�����)Constants)chunksize��� a;�� aN@�@@@��@����(run_rule��� aO�� aW@�@@@��@�����&Parmap!L��� aY�� aa@�����%rules��� ab�� ag@�@@@��� aX�� ah@��@@@@�H@@@��@�������$List$sort��� bip�� biy@�@@@��@��@@������"i1��� bi��� bi�@�@@@��@�� bi�� bi�@@@@�� bi� bi�@��@@@��@@������"i2�� bi�� bi�@�@@@��@�� bi�� bi�@@@@�� bi�� bi�@��@@@������'compare��' bi��( bi�@�@@@��@����"i1��2 bi��3 bi�@�@@@��@����"i2��= bi��> bi�@�@@@@�@@@�'A@@��C biz�D bi�@���G bi{
@@@@�]@@@@��@@@��@�������$List#map��V c���W c��@�@@@��@��@@����@��b c���c c��@@@����#cxs��j c���k c��@�@@@@��n c���o c��@��@@@����#cxs��x c���y c��@�@@@��| c���} c��@���� c��@@@@�,@@@@��@@@@��� `��@@�  ������-prerr_endline��� e���� e��@�@@@��@���+[All done!]@��� e���� e��@@@@�@@@����-rules_unspecs��� g���� g��@�@@@�@@@�#@@@�A@@@�@@@@�e@@@�s@@@��	A@@��
A@@��A@@@��� C	�	�@@�@���@�����/get_new_program��� i� �� i�@�@@@��@@���'program��� i��� i�@�@@@��@@���-rules_unspecs��� i��� i�%@�@@@������'program��� j(0�� j(7@�@@@������'Program��� k=A�� k=H@�������%decls��� k=J�� k=O@�@@@����"sp��� k=Q�� k=S@�@@@@��� k=I�� k=T@��@@@�@@@@��@��������%rules�� lXa� lXf@�@@@����)not_rules�� lXh� lXq@�@@@@�� lX`� lXr@��@@@�������$List)partition��) lXu�* lX�@�@@@��@�����$Rule'is_rule��6 lX��7 lX�@�@@@��@����%decls��A lX��B lX�@�@@@@�@@@@��F lX\@@��@�����)new_rules��P m���Q m��@�@@@�������$List$map2��] n���^ n��@�@@@��@��@@���$rule��i o���j o��@�@@@��@@���+fun_unspecs��s o���t o��@�@@@������$rule��~ p��� p��@�@@@������$Rule��� q��� q�	@��������+FunSpecList��� q��� q�@�������)fun_specs��� q��� q�!@�@@@����#sp1��� q�#�� q�&@�@@@@��� q��� q�'@��@@@�@@@����(fun_type��� q�)�� q�1@�@@@����#sp2��� q�3�� q�6@�@@@@��� q�
�� q�7@��4@@@�A@@@@����$Rule��� r;G�� r;K@��������+FunSpecList��� r;M�� r;X@����������!@��� r;f�� r;g@�@@@��@����+fun_unspecs��� r;Z�� r;e@�@@@��@����)fun_specs��  r;h� r;q@�@@@@�@@@�����#sp1�� r;s� r;v@�@@@@�� r;Y� r;w@��@@@�8@@@�����(fun_type�� r;y� r;�@�@@@�����#sp2��% r;��& r;�@�@@@@��) r;L�* r;�@��Q@@@�^@@@���@��2 s���3 s��@@@@������(failwith��< s���= s��@�@@@��@���)wrong AST@��F s���G s��@@@@�@@@@��J p��@@@��A@@��M o���N s��@���Q o��@@@��@����%rules��Z t���[ t��@�@@@��@����-rules_unspecs��e u���f u��@�@@@@�@@@@��j m��@@����'Program��q v���r v��@����������!@�� v���� v��@�@@@��@����)not_rules��� v���� v��@�@@@��@����)new_rules��� v���� v��@�@@@@�@@@�����"sp��� v���� v��@�@@@@��� v���� v��@��@@@�8@@@�@@@@�e@@@���@��� w��� w�@@@@������(failwith��� w��� w�@�@@@��@���)wrong AST@��� w��� w�@@@@�@@@@��� j(*@@@��A@@�A@@@��� i��@@�	@@