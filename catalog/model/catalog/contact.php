<?php
class ModelCatalogContact extends Model {
	public function getContact($id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "contact WHERE id = '" . (int)$id . "'");
	
		return $query->row;
	}
	
	
	
		
}
?>