resource "oci_core_subnet" "FoggyKitchenWebSubnet" {
  provider = oci.requestor
  cidr_block = var.WebSubnet-CIDR
  display_name = "FoggyKitchenWebSubnet"
  dns_label = "FoggyKitchenN2"
  compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
  vcn_id = oci_core_virtual_network.FoggyKitchenVCN.id
  route_table_id = oci_core_route_table.FoggyKitchenRouteTableViaNATandDRG1.id
  dhcp_options_id = oci_core_dhcp_options.FoggyKitchenDhcpOptions1.id
  security_list_ids = [oci_core_security_list.FoggyKitchenWebSecurityList.id,oci_core_security_list.FoggyKitchenSSHSecurityList.id]
}


