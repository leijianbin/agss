<?php

class ModelHomemanagerPagedata extends Model {

	public function addPagedata($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "sitepage_pagedata SET pcode = '" . (int) ($this->db->escape($data['pcode'])) . "', title = '" . $this->db->escape($data['title']) . "', title_en = '" . $this->db->escape($data['title_en']) . "', summary = '" . $this->db->escape($data['summary']) . "', summary_en = '" . $this->db->escape($data['summary_en']) . "', titlelink = '" . $this->db->escape($data['titlelink']) . "', price_origin = ' " . $this->db->escape($data['price_origin']) . "' , price_now = ' " . $this->db->escape($data['price_now']) . "' , quantity = ' " . $this->db->escape($data['quantity']) . "' , order_num = ' " . $this->db->escape($data['order_num']) . "' , subpcode = ' " . $this->db->escape($data['subpcode']) . "' , contact = ' " . $this->db->escape($data['contact']) . "' , isshow = ' " . $this->db->escape($data['isshow']) . "' , signdate = ' " . date('Y-m-d H:i:s') . "'");

		$pagedata_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "sitepage_pagedata SET image = '" . $this->db->escape($data['image']) . "' WHERE id = '" . (int) $pagedata_id . "'");
		}
		$this->cache->delete('Pagedata');
	}

	public function editPagedata($pagedata_id, $data) {


		$this->db->query("UPDATE " . DB_PREFIX . "sitepage_pagedata SET pcode = '" . (int) ($this->db->escape($data['pcode'])) . "', title = '" . $this->db->escape($data['title']) . "', title_en = '" . $this->db->escape($data['title_en']) . "', summary = '" . $this->db->escape($data['summary']) . "', summary_en = '" . $this->db->escape($data['summary_en']) . "', titlelink = '" . $this->db->escape($data['titlelink']) . "', price_origin = ' " . $this->db->escape($data['price_origin']) . "' , price_now = ' " . $this->db->escape($data['price_now']) . "' , quantity = ' " . $this->db->escape($data['quantity']) . "' , order_num = ' " . $this->db->escape($data['order_num']) . "' , subpcode = ' " . $this->db->escape($data['subpcode']) . "' , contact = ' " . $this->db->escape($data['contact']) . "' , isshow = ' " . $this->db->escape($data['isshow']) . "' , signdate = ' " . date('Y-m-d H:i:s') . "' WHERE id = " . (int) $pagedata_id . "");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "sitepage_pagedata SET image = '" . $this->db->escape($data['image']) . "' WHERE id = '" . (int) $pagedata_id . "'");
		}

		$this->cache->delete('Pagedata');
	}

	public function deletePagedata($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "sitepage_pagedata WHERE id = '" . (int) $id . "'");

		$this->cache->delete('Pagedata');
	}

	public function getPagedata($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sitepage_pagedata WHERE id = '" . (int) $id . "'");

		return $query->row;
	}

	public function getPagedatas($data = array()) {
		if ($data) {
			$sql = "SELECT s.id,s.title,s.title_en,s.pcode,s.summary,s.summary_en,s.price_origin,s.price_now,s.contact,s.quantity,s.order_num FROM " . DB_PREFIX . "sitepage_pagedata s";

			$sql .= ' LEFT JOIN ' . DB_PREFIX . 'homepage_layout h on h.id = s.pcode WHERE ';



			if ($data['layout']) {
				$sql .= 'h.layout = "' . $this->db->escape($data['layout']) . '"';
			} else {
				$sql .= 'h.layout = "homepage"';
			}

			if ($data['filter_id']) {
				$sql .= ' AND s.id = ' . (int) $data['filter_id'];
			}

			if ($data['filter_name']) {
				$sql .= ' AND s.title LIKE "%' . $data['filter_name'] . '%"';
			}

			$sort_data = array(
				's.id',
				's.title',
				's.order_num',
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY s.id";
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

				$sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
			}

			$query = $this->db->query($sql);
			return $query->rows;
		}
	}

	public function getTotalPagedatas($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sitepage_pagedata";

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

}

?>