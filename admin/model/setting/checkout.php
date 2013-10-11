<?php 
class ModelSettingCheckout extends Model {
	public function getCheckoutSetting() {
		$data = array(); 		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting_checkout" );
		return $query->rows;
	}

	public function getSingleSetting($step_id) {
		$data = array(); 		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting_checkout WHERE step_id = '" . (int)$step_id . "'");
		return $query->row;
	}
	
	public function editSetting($group, $data, $store_id = 0) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");

		foreach ($data as $key => $value) {
			if (!is_array($value)) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `group` = '" . $this->db->escape($group) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
			} else {
				$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `group` = '" . $this->db->escape($group) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(serialize($value)) . "', serialized = '1'");
			}
		}
	}

}
?>