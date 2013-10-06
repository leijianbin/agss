<?php
class ModelCatalogContact extends Model {
	public function addContact($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "contact SET email = '" . $this->db->escape($data['email']) . "', phone = '" . $this->db->escape($data['phone']) . "', address = '" . $this->db->escape($data['address']) . "', map_1 = '" . $this->db->escape($data['map_1']) . "', map_2 = '" . $this->db->escape($data['map_2']) . "', map_3 = '" . $this->db->escape($data['map_3']) . "', map_4 = '" . $this->db->escape($data['map_4']) . "'");

		$id = $this->db->getLastId(); 
		
		
		$this->cache->delete('contact');
	}
	
	public function editContact($id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "contact SET email = '" . $this->db->escape($data['email']) . "', phone = '" . $this->db->escape($data['phone']) . "', address = '" . $this->db->escape($data['address']) . "', map_1 = '" . $this->db->escape($data['map_1']) . "', map_2 = '" . $this->db->escape($data['map_2']) . "', map_3 = '" . $this->db->escape($data['map_3']) . "', map_4 = '" . $this->db->escape($data['map_4']) . "' WHERE id = '" . (int)$id . "'");
		
		$this->cache->delete('contact');
	}
	
	public function deleteContact($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "contact WHERE id = '" . (int)$id . "'");

		$this->cache->delete('contact');
	}	

	public function getContact($id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "contact WHERE id = '" . (int)$id . "'");
		
		return $query->row;
	}
		
	public function getContacts($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "contact";
		
			$sort_data = array(
				'email',
				'id'
			);		
		
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY id";	
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
		
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}		

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
			
			$query = $this->db->query($sql);
			
			return $query->rows;
		} else {
			$contact_data = $this->cache->get('contact.' . (int)$this->config->get('config_language_id'));
		
			if (!$contact_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "contact ORDER BY id");
	
				$contact_data = $query->rows;
			
				$this->cache->set('contact.' . (int)$this->config->get('config_language_id'), $contact_data);
			}	
	
			return $contact_data;			
		}
	}
	
	
		
	public function getTotalContacts() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "contact");
		
		return $query->row['total'];
	}	
	
}
?>