<?php  
class ControllerPurchasePurchase extends Controller {
	
	public function index() { 
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/purchase/purchase.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/purchase/purchase.tpl';
		} else {
			$this->template = 'default/template/purchase/purchase.tpl';
		}
					
		$this->response->setOutput($this->render());
  }
	
}
?>