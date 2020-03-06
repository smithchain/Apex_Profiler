prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.10.04'
,p_release=>'19.2.0.00.18'
,p_default_workspace_id=>37181779490747874089
,p_default_application_id=>93690
,p_default_id_offset=>0
,p_default_owner=>'ASHISH_ME'
);
end;
/
 
prompt APPLICATION 93690 - Ashish Sahay Plugins
--
-- Application Export:
--   Application:     93690
--   Name:            Ashish Sahay Plugins
--   Date and Time:   22:33 Friday March 6, 2020
--   Exported By:     ASHISHHEAKER@GMAIL.COM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 30430383078814959836
--   Manifest End
--   Version:         19.2.0.00.18
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/apex_profiler
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(30430383078814959836)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'APEX_PROFILER'
,p_display_name=>'Apex profiler'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#apex_profiler.min.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION F_AJAX (',
'    P_DYNAMIC_ACTION   IN APEX_PLUGIN.T_DYNAMIC_ACTION,',
'    P_PLUGIN           IN APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_AJAX_RESULT IS',
'    VR_RESULT         APEX_PLUGIN.T_DYNAMIC_ACTION_AJAX_RESULT;',
'BEGIN',
'    APEX_UTIL.JSON_FROM_SQL( SQLQ   => P_DYNAMIC_ACTION.ATTRIBUTE_04 );',
'    RETURN VR_RESULT;',
'END;',
'',
'FUNCTION F_RENDER (',
'    P_DYNAMIC_ACTION   IN APEX_PLUGIN.T_DYNAMIC_ACTION,',
'    P_PLUGIN           IN APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT AS',
'    VR_RESULT         APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'BEGIN',
'    APEX_CSS.ADD_FILE(',
'        P_NAME        => ''apex_profiler.min'',',
'        P_DIRECTORY   => P_PLUGIN.FILE_PREFIX,',
'        P_VERSION     => NULL,',
'        P_KEY         => ''ashish''',
'    );',
'',
'   APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME        => ''apex_profiler.min'',',
'        P_DIRECTORY   => P_PLUGIN.FILE_PREFIX,',
'        P_VERSION     => NULL,',
'        P_KEY         => ''sahay''',
'    );',
'',
'    VR_RESULT.JAVASCRIPT_FUNCTION   := ''function () {',
'  apex_profiler.initialize('' ||',
'    APEX_JAVASCRIPT.ADD_VALUE( P_DYNAMIC_ACTION.ATTRIBUTE_02, TRUE ) ||',
'    APEX_JAVASCRIPT.ADD_VALUE( P_DYNAMIC_ACTION.ATTRIBUTE_03, TRUE )  ||',
'    APEX_JAVASCRIPT.ADD_VALUE( APEX_PLUGIN.GET_AJAX_IDENTIFIER, TRUE ) ||',
'    APEX_JAVASCRIPT.ADD_VALUE( P_DYNAMIC_ACTION.ATTRIBUTE_01, FALSE )  ||',
'    '');}'';',
'',
'    RETURN VR_RESULT;',
'END;'))
,p_api_version=>2
,p_render_function=>'F_RENDER'
,p_ajax_function=>'F_AJAX'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'https://apex.oracle.com/pls/apex/f?p=93690:10:108661962681829::NO:::'
,p_files_version=>229
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30430383330903959840)
,p_plugin_id=>wwv_flow_api.id(30430383078814959836)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'ConfigJSON'
,p_attribute_type=>'JAVASCRIPT'
,p_is_required=>false
,p_default_value=>'{"isActiveColor": "#F44336","isInctiveColor": "#F4bc36", "panelHeight": "216px", "panelWIdth": "401px", "marginRight": "0px", "marginTop": "48px"}'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30430383705894959842)
,p_plugin_id=>wwv_flow_api.id(30430383078814959836)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Trigger Element ID'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'open-apex-profile'
,p_is_translatable=>false
,p_attribute_comment=>'Element it is used for triggering the profile.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30430384100088959842)
,p_plugin_id=>wwv_flow_api.id(30430383078814959836)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Items to Submit'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30430384593923959842)
,p_plugin_id=>wwv_flow_api.id(30430383078814959836)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'SQL Source'
,p_attribute_type=>'SQL'
,p_is_required=>false
,p_default_value=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Ashish'' FIRST_NAME,''Sahay'' LAST_NAME ,',
'''https://1.bp.blogspot.com/-V1JkM-D5VY4/XmCZuNHGytI/AAAAAAAAdec/RsZXgr11hHM8TXuWiLyns_4L9DJ4LPD2QCK4BGAYYCw/s113/0%253Fe%253D1586390400%2526v%253Dbeta%2526t%253DrDhapAPOdu3qco8WpAs1kTxVPf0533bNvx92guVCyVw'' IMAGE_SRC,',
'''https://www.ashishsahay.com/search/label/APEX'' EDIT_LINK_SRC,',
'''ashishk392@gmail.com'' EMAIL,',
'''INCEDO INC.''  ORG_NAME,',
'''Company'' ORG_LABEL,',
'''Oracle Apex Developer'' DESIGNATION,',
'''Github'' LEFT_BUTTON_LABEL,',
'''Blogs'' RIGHT_BUTTON_LABEL,',
'''https://github.com/ashishtheapexian'' LEFT_BUTTON_LINK,',
'''https://www.ashishsahay.com'' RIGHT_BUTTON_LINK,',
'''true'' LEFT_BUTTON_HOT,',
'''true'' RIGHT_BUTTON_HOT,',
'''left'' LEFT_BTN_ICON_POS,',
'''right'' RIGHT_BTN_ICON_POS,',
'''fa fa-github'' LEFT_BTN_ICON,',
'''fa fa-google'' RIGHT_BTN_ICON,',
'''See My Blogs'' EDIT_LINK_LABEL',
'FROM EMP WHERE ROWNUM<2'))
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30430384991246959843)
,p_plugin_id=>wwv_flow_api.id(30430383078814959836)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Escape special Characters'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30430385320257959843)
,p_plugin_attribute_id=>wwv_flow_api.id(30430384991246959843)
,p_display_sequence=>10
,p_display_value=>'Yes'
,p_return_value=>'Y'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30430385809988959844)
,p_plugin_attribute_id=>wwv_flow_api.id(30430384991246959843)
,p_display_sequence=>20
,p_display_value=>'No'
,p_return_value=>'N'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '3A666F6375737B6F75746C696E653A3021696D706F7274616E747D2E50524F465F444944202E742D4469616C6F67526567696F6E2D627574746F6E737B6261636B67726F756E642D636F6C6F723A236662666266627D2E742D427574746F6E2E742D4275';
wwv_flow_api.g_varchar2_table(2) := '74746F6E2D2D6865616465723A6163746976652C2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A666F6375733A6163746976657B6261636B67726F756E642D636F6C6F723A7267626128302C302C302C302921696D706F7274616E74';
wwv_flow_api.g_varchar2_table(3) := '7D2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A6163746976653A666F6375733A6265666F72652C2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A666F6375733A6265666F72657B626F782D736861646F773A6E';
wwv_flow_api.g_varchar2_table(4) := '6F6E6521696D706F7274616E747D2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A686F7665727B6261636B67726F756E642D636F6C6F723A7267626128302C302C302C30293B626F782D736861646F773A6E6F6E6521696D706F7274';
wwv_flow_api.g_varchar2_table(5) := '616E747D2E50524F465F4449442E75692D7769646765742E75692D6469616C6F677B72696768743A3021696D706F7274616E743B6C6566743A696E697469616C21696D706F7274616E743B666C6F61743A726967687421696D706F7274616E743B746F70';
wwv_flow_api.g_varchar2_table(6) := '3A3437707821696D706F7274616E743B626F726465722D7261646975733A2E3472656D21696D706F7274616E743B626F782D736861646F773A7267626128302C302C302C2E31292030202E3472656D20312E3672656D21696D706F7274616E747D2E5052';
wwv_flow_api.g_varchar2_table(7) := '4F465F4449442E75692D6469616C6F677B77696474683A333230707821696D706F7274616E743B6865696768743A323630707821696D706F7274616E747D2365786974706F7075705F62677B6865696768743A323630707821696D706F7274616E747D2E';
wwv_flow_api.g_varchar2_table(8) := '50524F465F4449442E75692D6469616C6F67202E75692D6469616C6F672D7469746C656261727B6261636B67726F756E642D636F6C6F723A236666663B626F726465722D626F74746F6D3A31707820736F6C6964207267626128302C302C302C2E303529';
wwv_flow_api.g_varchar2_table(9) := '3B646973706C61793A6E6F6E657D2E612D4D65646961426C6F636B2E612D4D656E752D636F6E74656E747B6261636B67726F756E643A3020303B626F726465723A6E6F6E653B626F782D736861646F773A6E6F6E657D2E612D4865616465722D6163636F';
wwv_flow_api.g_varchar2_table(10) := '756E744469616C6F67202E612D4D65646961426C6F636B2D677261706869637B6D617267696E2D72696768743A313670787D2E612D4D65646961426C6F636B2D677261706869637B666C6F61743A6C6566743B6D617267696E2D72696768743A3870787D';
wwv_flow_api.g_varchar2_table(11) := '2E612D4865616465722D6163636F756E744469616C6F67202E612D4865616465722D7573657250686F746F2D2D6C617267657B6261636B67726F756E642D636F6C6F723A236638663866387D2E612D4865616465722D7573657250686F746F7B626F782D';
wwv_flow_api.g_varchar2_table(12) := '736861646F773A302030203020317078202362306230623020696E7365747D2E612D4865616465722D7573657250686F746F7B646973706C61793A696E6C696E652D626C6F636B3B77696474683A323470783B6865696768743A323470783B626F726465';
wwv_flow_api.g_varchar2_table(13) := '722D7261646975733A313030253B766572746963616C2D616C69676E3A746F703B6F766572666C6F773A68696464656E3B706F736974696F6E3A72656C61746976657D2E612D4865616465722D6163636F756E744469616C6F672E612D4D656E75202E61';
wwv_flow_api.g_varchar2_table(14) := '2D4D656E752D6C6162656C7B70616464696E673A307D2E612D4865616465722D6163636F756E744469616C6F672E612D4D656E75202E612D4D656E752D6974656D7B646973706C61793A696E68657269743B636F6C6F723A696E68657269743B6C696E65';
wwv_flow_api.g_varchar2_table(15) := '2D6865696768743A696E68657269743B666C6F61743A6E6F6E657D2E612D4865616465722D6163636F756E744469616C6F672D6564697450726F66696C652E612D4D656E752D6974656D2E612D4D656E752D6C6162656C7B746578742D616C69676E3A63';
wwv_flow_api.g_varchar2_table(16) := '656E7465727D2E612D4865616465722D6163636F756E744469616C6F672D6564697450726F66696C652E612D4D656E752D6974656D2E612D4D656E752D6C6162656C2C2E612D4D656E752D636F6E74656E74202E612D4865616465722D6469616C6F674C';
wwv_flow_api.g_varchar2_table(17) := '696E6B2E612D4D656E752D6974656D202E612D4D656E752D6C6162656C7B646973706C61793A626C6F636B3B6D617267696E2D746F703A3470783B636F6C6F723A233134366662387D2E612D4865616465722D6163636F756E744469616C6F672D656469';
wwv_flow_api.g_varchar2_table(18) := '7450726F66696C652E612D4D656E752D6974656D2E612D4D656E752D6C6162656C2C2E612D4865616465722D6469616C6F674C696E6B2E612D4D656E752D6974656D202E612D4D656E752D6C6162656C7B666F6E742D73697A653A313170783B6C696E65';
wwv_flow_api.g_varchar2_table(19) := '2D6865696768743A313670783B70616464696E673A303B626F726465722D7261646975733A3270783B7472616E736974696F6E3A6E6F6E657D2E612D4865616465722D6163636F756E744469616C6F67202E612D4D65646961426C6F636B2D636F6E7465';
wwv_flow_api.g_varchar2_table(20) := '6E747B70616464696E673A34707820307D2E612D4865616465722D7573657250686F746F2D2D6C617267652C2E612D4865616465722D7573657250686F746F2D2D6C61726765202E612D49636F6E2C2E612D4865616465722D7573657250686F746F2D2D';
wwv_flow_api.g_varchar2_table(21) := '6C6172676520696D677B77696474683A363470783B6865696768743A363470787D2E612D4865616465722D6469616C6F674E616D657B666F6E742D7765696768743A3330303B666F6E742D73697A653A323070783B6C696E652D6865696768743A323470';
wwv_flow_api.g_varchar2_table(22) := '787D2E612D4865616465722D6469616C6F67546578747B646973706C61793A626C6F636B3B6C696E652D6865696768743A313670787D2E612D4865616465722D70686F746F506C616365686F6C6465727B706F736974696F6E3A6162736F6C7574653B6C';
wwv_flow_api.g_varchar2_table(23) := '6566743A303B746F703A303B72696768743A303B626F74746F6D3A303B626F726465722D7261646975733A313030253B626F782D736861646F773A302030203020317078207267626128302C302C302C2E31352920696E7365747D2E612D486561646572';
wwv_flow_api.g_varchar2_table(24) := '2D6163636F756E744469616C6F672E612D4D656E75202E612D4D656E752D6974656D7B646973706C61793A696E68657269743B636F6C6F723A696E68657269743B6C696E652D6865696768743A696E68657269743B666C6F61743A6E6F6E657D2E612D48';
wwv_flow_api.g_varchar2_table(25) := '65616465722D6163636F756E744469616C6F672E612D4D656E75202E612D4D65646961426C6F636B2D636F6E74656E74202E612D4D656E752D6974656D2E612D4D656E752D6C6162656C7B637572736F723A64656661756C747D2E612D4865616465722D';
wwv_flow_api.g_varchar2_table(26) := '6469616C6F67557365726E616D657B666F6E742D73697A653A313170783B666F6E742D7765696768743A3430307D2E612D4865616465722D6469616C6F674C6162656C2C2E612D4865616465722D6469616C6F67557365726E616D657B636F6C6F723A23';
wwv_flow_api.g_varchar2_table(27) := '3737377D2E612D4865616465722D6469616C6F674C6162656C7B6D617267696E2D746F703A313670783B6C696E652D6865696768743A313070783B666F6E742D73697A653A3970783B646973706C61793A626C6F636B7D2E612D4865616465722D646961';
wwv_flow_api.g_varchar2_table(28) := '6C6F6756616C75657B666F6E742D73697A653A313270783B6C696E652D6865696768743A313670787D2E612D4865616465722D6469616C6F674E616D652C2E612D4865616465722D6469616C6F6756616C75657B636F6C6F723A233430343034307D2E70';
wwv_flow_api.g_varchar2_table(29) := '726F66696C652D69636F6E7B6261636B67726F756E642D636F6C6F723A7472616E73706172656E743B6261636B67726F756E642D7265706561743A6E6F2D7265706561743B6261636B67726F756E642D73697A653A323470783B646973706C61793A696E';
wwv_flow_api.g_varchar2_table(30) := '6C696E652D626C6F636B3B6865696768743A323470783B77696474683A323470783B766572746963616C2D616C69676E3A626173656C696E653B637572736F723A706F696E7465723B626F726465722D7261646975733A313030253B6D617267696E2D72';
wwv_flow_api.g_varchar2_table(31) := '696768743A3570787D2023556E697175654964466F7250726F66696C657B7A2D696E6465783A3939397D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(30431207014653963222)
,p_plugin_id=>wwv_flow_api.id(30430383078814959836)
,p_file_name=>'apex_profiler.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '76617220617065785F70726F66696C65723D66756E6374696F6E28297B76617220613D66756E6374696F6E28612C652C6E297B76617220692C6F2C742C732C642C6C2C722C702C632C672C752C5F2C762C542C682C4E3B7472797B6C5F436F6E6669674A';
wwv_flow_api.g_varchar2_table(2) := '534F4E3D4A534F4E2E7061727365286E297D63617463682861297B636F6E736F6C652E6572726F722822496E2076616C6964205365747570204A534F4E22292C636F6E736F6C652E6572726F722861292C636F6E736F6C652E6572726F72286E297D242E';
wwv_flow_api.g_varchar2_table(3) := '6561636828652C66756E6374696F6E28612C65297B693D652E494D4147455F5352432C6F3D652E46495253545F4E414D452C743D652E4C4153545F4E414D452C733D652E454449545F4C494E4B5F5352432C4D3D652E454D41494C2C643D652E4F52475F';
wwv_flow_api.g_varchar2_table(4) := '4E414D452C6C3D652E44455349474E4154494F4E2C723D652E4C4546545F425554544F4E5F4C4142454C2C703D652E52494748545F425554544F4E5F4C4142454C2C652E4C454654425554544F4E5F484F542C652E4C454654425554544F4E5F49434F4E';
wwv_flow_api.g_varchar2_table(5) := '5F504F532C633D652E4C4546545F42544E5F49434F4E2C652E7269676874427574746F6E5F686F742C652E7269676874427574746F6E5F69636F6E5F706F732C673D652E52494748545F42544E5F49434F4E2C753D2227222B652E4C4546545F42555454';
wwv_flow_api.g_varchar2_table(6) := '4F4E5F4C494E4B2B2227222C6C5F72696768745F6C696E6B3D2227222B652E52494748545F425554544F4E5F4C494E4B2B2227222C5F3D2274727565223D3D652E4C4546545F425554544F4E5F484F543F22686F74223A22222C6C5F7269676874427574';
wwv_flow_api.g_varchar2_table(7) := '746F6E486F743D2274727565223D3D652E52494748545F425554544F4E5F484F543F22686F74223A22222C763D652E4C4546545F42544E5F49434F4E5F504F532C543D652E52494748545F42544E5F49434F4E5F504F532C683D652E4F52475F4C414245';
wwv_flow_api.g_varchar2_table(8) := '4C2C4E3D652E454449545F4C494E4B5F4C4142454C7D293B76617220493D2428273C6469762069643D22556E697175654964466F7250726F66696C652220636C6173733D22742D4469616C6F67526567696F6E206A732D6D6F64616C206A732D64726167';
wwv_flow_api.g_varchar2_table(9) := '6761626C65206A732D726573697A61626C65206A732D6469616C6F672D73697A653438307833323020206A732D726567696F6E4469616C6F672075692D6469616C6F672D636F6E74656E742075692D7769646765742D636F6E74656E7422207374796C65';
wwv_flow_api.g_varchar2_table(10) := '3D2277696474683A20272B6C5F436F6E6669674A534F4E2E70616E656C57496474682B223B706F736974696F6E3A2066697865643B746F703A20222B6C5F436F6E6669674A534F4E2E6D617267696E546F702B223B72696768743A20222B6C5F436F6E66';
wwv_flow_api.g_varchar2_table(11) := '69674A534F4E2E6D617267696E52696768742B223B206D696E2D6865696768743A203070783B206D61782D6865696768743A206E6F6E653B206865696768743A20222B6C5F436F6E6669674A534F4E2E70616E656C4865696768742B272021696D706F72';
wwv_flow_api.g_varchar2_table(12) := '74616E743B2220617269612D6C6976653D22706F6C697465223E20203C2F6469763E27292C4F3D2428273C64697620636C6173733D22742D4469616C6F67526567696F6E2D626F6479206A732D726567696F6E4469616C6F672D626F647922207374796C';
wwv_flow_api.g_varchar2_table(13) := '653D22626F74746F6D3A20363470783B223E3C2F6469763E27292C423D2428273C6469762069643D227265706F72745F32313433363830353034333035353736363730315F6361746368223E203C2F6469763E27292C623D2428273C6469762069643D22';
wwv_flow_api.g_varchar2_table(14) := '6163636F756E744D656E755F6D656E752220636C6173733D22612D4865616465722D6163636F756E744469616C6F672220746162696E6465783D222D31223E3C2F6469763E27292C663D2428273C64697620636C6173733D22612D4D65646961426C6F63';
wwv_flow_api.g_varchar2_table(15) := '6B20612D4D656E752D636F6E74656E74223E3C2F6469763E27292C4C3D2428273C64697620636C6173733D22612D4D65646961426C6F636B2D67726170686963223E3C2F6469763E27292C433D2428273C7370616E20636C6173733D22612D4865616465';
wwv_flow_api.g_varchar2_table(16) := '722D7573657250686F746F20612D4865616465722D7573657250686F746F2D2D6C61726765223E3C2F7370616E3E27292C483D2428273C696D67207372633D22272B692B2722206865696768743D223634222077696474683D2236342220636C6173733D';
wwv_flow_api.g_varchar2_table(17) := '22612D4865616465722D70686F746F2220616C743D2250726F66696C6520696D61676520666F72207573657220272B6F2B27223E27293B242843292E617070656E642848292C24284C292E617070656E642843293B76617220523D2428273C6120687265';
wwv_flow_api.g_varchar2_table(18) := '663D22272B732B272220636C6173733D22612D4865616465722D6163636F756E744469616C6F672D6564697450726F66696C6520612D4D656E752D6974656D20612D4D656E752D6C6162656C222069643D22454449545F50524F46494C455F4C494E4B22';
wwv_flow_api.g_varchar2_table(19) := '3E272B4E2B223C2F613E22293B24284C292E617070656E642852292C242866292E617070656E64284C293B76617220453D2428273C64697620636C6173733D22612D4D65646961426C6F636B2D636F6E74656E74223E27292C6D3D2428273C6469762063';
wwv_flow_api.g_varchar2_table(20) := '6C6173733D22612D4D656E752D6C6162656C20612D4D656E752D6974656D2220746162696E6465783D222D31223E27292C533D2428273C7370616E20636C6173733D22612D4865616465722D6469616C6F675465787420612D4865616465722D6469616C';
wwv_flow_api.g_varchar2_table(21) := '6F674E616D65223E272B6F2B2220222B742B223C2F7370616E3E22292C4D3D2428273C7370616E20636C6173733D22612D4865616465722D6469616C6F675465787420612D4865616465722D6469616C6F67557365726E616D65223E272B4D2B223C2F73';
wwv_flow_api.g_varchar2_table(22) := '70616E3E22293B24286D292E617070656E642853292C24286D292E617070656E64284D293B76617220783D2428273C64697620636C6173733D22612D4D656E752D6C6162656C20612D4D656E752D6974656D2220746162696E6465783D222D31223E3C2F';
wwv_flow_api.g_varchar2_table(23) := '6469763E27292C413D2428273C7370616E20636C6173733D22612D4865616465722D6469616C6F674C6162656C223E272B682B223C2F7370616E3E22292C443D2428273C7370616E20636C6173733D22612D4865616465722D6469616C6F6756616C7565';
wwv_flow_api.g_varchar2_table(24) := '223E272B642B223C2F7370616E3E22293B242878292E617070656E642841292C242878292E617070656E642844293B2428273C64697620636C6173733D22612D4D656E752D6C6162656C20612D4D656E752D6974656D2220746162696E6465783D222D31';
wwv_flow_api.g_varchar2_table(25) := '223E3C2F6469763E27292C2428273C7370616E20636C6173733D22612D4865616465722D6469616C6F674C6162656C223E526F6C653C2F7370616E3E27293B76617220463D2428273C7370616E20636C6173733D22612D4865616465722D6469616C6F67';
wwv_flow_api.g_varchar2_table(26) := '56616C7565223E272B6C2B223C2F7370616E3E22293B242845292E617070656E64286D292C242845292E617070656E642878292C242845292E617070656E642846292C242866292E617070656E642845292C242862292E617070656E642866292C242842';
wwv_flow_api.g_varchar2_table(27) := '292E617070656E642862292C24284F292E617070656E642842292C242849292E617070656E64284F293B76617220553D2428273C64697620636C6173733D22742D4469616C6F67526567696F6E2D627574746F6E73206A732D726567696F6E4469616C6F';
wwv_flow_api.g_varchar2_table(28) := '672D627574746F6E73223E3C2F6469763E27292C503D2428273C64697620636C6173733D22742D427574746F6E526567696F6E20742D427574746F6E526567696F6E2D2D6469616C6F67526567696F6E223E3C2F6469763E27293B66756E6374696F6E20';
wwv_flow_api.g_varchar2_table(29) := '6B28612C652C6E2C692C6F2C74297B76617220733D2428273C64697620636C6173733D22742D427574746F6E526567696F6E2D636F6C20742D427574746F6E526567696F6E2D636F6C2D2D272B612B27223E27292C643D2428273C64697620636C617373';
wwv_flow_api.g_varchar2_table(30) := '3D22742D427574746F6E526567696F6E2D627574746F6E73223E3C2F6469763E27292C6C3D2428273C627574746F6E206F6E636C69636B3D22617065782E6E617669676174696F6E2E726564697265637428272B6E2B27293B2220636C6173733D22742D';
wwv_flow_api.g_varchar2_table(31) := '427574746F6E20742D427574746F6E2D2D272B6F2B272220747970653D22627574746F6E222069643D22223E27292C723D2428273C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E272B692B223C2F7370616E3E22292C703D2428';
wwv_flow_api.g_varchar2_table(32) := '273C7370616E20636C6173733D22742D49636F6E20742D49636F6E2D2D272B652B2220666120222B742B272220617269612D68696464656E3D2274727565223E3C2F7370616E3E27293B72657475726E226C656674223D3D653F242872292E7072657065';
wwv_flow_api.g_varchar2_table(33) := '6E642870293A242872292E617070656E642870292C24286C292E617070656E642872292C242864292E617070656E64286C292C242873292E617070656E642864292C737D766172204A3D2428273C64697620636C6173733D22742D427574746F6E526567';
wwv_flow_api.g_varchar2_table(34) := '696F6E2D77726170223E3C2F6469763E27293B24284A292E617070656E64286B28226C656674222C762C752C722C5F2C6329292C24284A292E617070656E64286B28227269676874222C542C6C5F72696768745F6C696E6B2C702C6C5F72696768744275';
wwv_flow_api.g_varchar2_table(35) := '74746F6E486F742C6729292C242850292E617070656E64284A292C242855292E617070656E642850292C242849292E617070656E642855292C242822626F647922292E617070656E642849292C24282223556E697175654964466F7250726F66696C6522';
wwv_flow_api.g_varchar2_table(36) := '292E6869646528292C2428222E222B61292E616464436C61737328226E6F742D61637469766522292C2428222E6E6F742D61637469766522292E63737328226261636B67726F756E64222C6C5F436F6E6669674A534F4E2E6973496E6374697665436F6C';
wwv_flow_api.g_varchar2_table(37) := '6F72292C2428222E222B61292E62696E642822636C69636B222C66756E6374696F6E28297B242874686973292E686173436C61737328226E6F742D61637469766522293F28242874686973292E616464436C61737328226F70656E2D626F7822292C2428';
wwv_flow_api.g_varchar2_table(38) := '222E6F70656E2D626F7822292E63737328226261636B67726F756E64222C6C5F436F6E6669674A534F4E2E6973416374697665436F6C6F72292C242874686973292E72656D6F7665436C61737328226E6F742D6163746976652229293A28242874686973';
wwv_flow_api.g_varchar2_table(39) := '292E616464436C61737328226E6F742D61637469766522292C242874686973292E72656D6F7665436C61737328226F70656E2D626F7822292C2428222E6E6F742D61637469766522292E63737328226261636B67726F756E64222C6C5F436F6E6669674A';
wwv_flow_api.g_varchar2_table(40) := '534F4E2E6973496E6374697665436F6C6F7229292C24282223556E697175654964466F7250726F66696C6522292E746F67676C6528297D297D3B72657475726E7B696E697469616C697A653A66756E6374696F6E28652C6E2C692C6F297B617065782E73';
wwv_flow_api.g_varchar2_table(41) := '65727665722E706C7567696E28692C7B706167654974656D733A6E7D2C7B737563636573733A66756E6374696F6E286E297B76617220693D6E2E726F773B6128652C692C6F297D2C6572726F723A66756E6374696F6E2861297B636F6E736F6C652E6572';
wwv_flow_api.g_varchar2_table(42) := '726F7228224572726F72207768696C652074727920746F206C6F616420646174612122297D2C64617461547970653A226A736F6E227D297D7D7D28293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(30431207344119963224)
,p_plugin_id=>wwv_flow_api.id(30430383078814959836)
,p_file_name=>'apex_profiler.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
