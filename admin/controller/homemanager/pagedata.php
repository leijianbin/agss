<?php
class ControllerHomemanagerPagedata extends Controller {
	private $error = array(); 
     
  	public function index() {
		$this->load->language('homemanager/pagedata');
    		
		//$this->document->setTitle(str_replace('Home', ucfirst($_GET['layout']), $this->language->get('heading_title'))); 
		
		$this->load->model('homemanager/pagedata');
		
		$this->getList();
  	}
  
  	public function insert() {
    	$this->load->language('homemanager/pagedata');

    	//$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->load->model('homemanager/pagedata');
		
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_homemanager_pagedata->addPagedata($this->request->post);
	  		
			$this->session->data['success'] = $this->language->get('text_success');
	  
			$url = '';
					
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			if(isset($this->request->get['layout'])){
				$layout = $this->request->get['layout'];
			} else {
				$layout = 'homepage';
			}
			
			$this->redirect($this->url->link('homemanager/pagedata', 'layout='.$layout.'&token=' . $this->session->data['token'] . $url, 'SSL'));
    	}
	
    	$this->getForm();
  	}

  	public function update() {
    	$this->load->language('homemanager/pagedata');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('homemanager/pagedata');
			
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_homemanager_pagedata->editPagedata($this->request->get['pagedata_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
					
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			if(isset($this->request->get['layout'])){
				$layout = $this->request->get['layout'];
			} else {
				$layout = 'homepage';
			}
			
			$this->redirect($this->url->link('homemanager/pagedata', 'layout='.$layout.'&token=' . $this->session->data['token'] . $url, 'SSL'));
		}
    	$this->getForm();
  	}

  	public function delete() {
    	$this->load->language('homemanager/pagedata');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('homemanager/pagedata');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $pagedata_id) {
				$this->model_homemanager_pagedata->deletePagedata($pagedata_id);
	  		}

			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
					
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('homemanager/pagedata', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getList();
  	}

	
  	private function getList() {				
		

		if (isset($this->request->get['filter_id'])) {
			$filter_id = $this->request->get['filter_id'];
		} else {
			$filter_id = null;
		}
		
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}
		
		if (isset($this->request->get['filter_pcode'])) {
			$filter_pcode = $this->request->get['filter_pcode'];
		} else {
			$filter_pcode = null;
		}
		
		if (isset($this->request->get['layout'])) {
			$layout = $this->request->get['layout'];
		} else {
			$layout = null;
		}
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 's.id';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
						
		$url = '';
						
		if (isset($this->request->get['filter_id'])) {
			$url .= '&filter_id=' . $this->request->get['filter_id'];
		}
		
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . $this->request->get['filter_name'];
		}	
		
		if (isset($this->request->get['filter_pcode'])) {
			$url .= '&filter_pcode=' . $this->request->get['filter_pcode'];
		}
		
		if (isset($this->request->get['layout'])) {
			$url .= '&layout=' . $this->request->get['layout'];
		}
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('homemanager/pagedata', 'token=' . $this->session->data['token'] . $url, 'SSL'),       		
      		'separator' => ' :: '
   		);
		
		$this->data['insert'] = $this->url->link('homemanager/pagedata/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('homemanager/pagedata/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
    	
		$this->data['products'] = array();

		$data = array(
			'filter_id'	  => $filter_id,
			'filter_name'	  => $filter_name,
			'layout'     => $layout,
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_admin_limit'),
//			'limit'           => $this->config->get('config_admin_limit')
			'limit'           => 200
		);
		
		
		$pagedata_total = $this->model_homemanager_pagedata->getTotalPagedatas($data);
			
		$results = $this->model_homemanager_pagedata->getPagedatas($data);
		
		$this->load->model('homemanager/homelayout');
		
		$results_homelayout = $this->model_homemanager_homelayout->getHomelayouts(array('limit' => 100));
		$results_positions = array();
		foreach($results_homelayout as $key => $value){
			$results_positions[$value['id']] = array('position' => $value['position'], 'layout' => $value['layout'], 'name' => $value['name']);
		}
		
		foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('homemanager/pagedata/update', 'token=' . $this->session->data['token'] . '&pagedata_id=' . $result['id'] . $url, 'SSL')
			);

      		$this->data['pagedatas'][] = array(
				'pagedata_id' => $result['id'],
				'title'       => $result['title'],
				'pcode'      => $results_positions[$result['pcode']]['position'],
				'name'      => $results_positions[$result['pcode']]['name'],
				'title_en'      => $result['title_en'],
				'summary'      => $result['summary'],
				'summary_en'      => $result['summary_en'],
				'price_origin'      => $result['price_origin'],
				'price_now'      => $result['price_now'],
				'contact'      => $result['contact'],
				'quantity'      => $result['quantity'],
				'order_num'      => $result['order_num'],
				'layout'      => $results_positions[$result['pcode']]['layout'],
				'selected'   => isset($this->request->post['selected']) && in_array($result['product_id'], $this->request->post['selected']),
				'action'     => $action
			);
    	}
		
		//$this->data['heading_title'] = str_replace('Home', ucfirst($_GET['layout']), $this->language->get('heading_title'));		
				
		$this->data['column_id'] = $this->language->get('column_id');	
		$this->data['column_title'] = $this->language->get('column_title');
		$this->data['column_title_en'] = $this->language->get('column_title_en');
		$this->data['column_summary'] = $this->language->get('column_summary');
		$this->data['column_summary_en'] = $this->language->get('column_summary_en');
		$this->data['column_price_origin'] = $this->language->get('column_price_origin');
		$this->data['column_price_now'] = $this->language->get('column_price_now');
		$this->data['column_contact'] = $this->language->get('column_contact');
		$this->data['column_pcode'] = $this->language->get('column_pcode');	
		$this->data['column_name'] = $this->language->get('column_name');	
		$this->data['column_order_num'] = $this->language->get('column_order_num');	
		$this->data['column_quantity'] = $this->language->get('column_quantity');	
		$this->data['column_layout'] = $this->language->get('column_layout');	
		$this->data['column_action'] = $this->language->get('column_action');		
				
		$this->data['button_insert'] = $this->language->get('button_insert');		
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_filter'] = $this->language->get('button_filter');
		 
 		$this->data['token'] = $this->session->data['token'];
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$url = '';
		
		if (isset($this->request->get['filter_id'])) {
			$url .= '&filter_id=' . $this->request->get['filter_id'];
		}
		
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . $this->request->get['filter_name'];
		}
		
		if (isset($this->request->get['filter_pcode'])) {
			$url .= '&filter_pcode=' . $this->request->get['filter_pcode'];
		}
		
		if (isset($this->request->get['layout'])) {
			$url .= '&layout=' . $this->request->get['layout'];
		}

												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}
		
		$this->data['sort_id'] = $this->url->link('homemanager/pagedata', 'token=' . $this->session->data['token'] . '&sort=s.id' . $url, 'SSL');
		$this->data['sort_name'] = $this->url->link('homemanager/pagedata', 'token=' . $this->session->data['token'] . '&sort=s.title' . $url, 'SSL');
		//temperally delete the pagination
//		$pagination = new Pagination();
//		$pagination->total = $pagedata_total;
//		$pagination->page = $page;
//		$pagination->limit = $this->config->get('config_admin_limit');
//		$pagination->text = $this->language->get('text_pagination');
//		$pagination->url = $this->url->link('homemanager/pagedata', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
//		$this->data['pagination'] = $pagination->render();
		$this->data['pagination'] = '';
		$this->data['filter_id'] = $filter_id;
	
	
		
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->layout = 'common/layout';
		$this->template = 'homemanager/pagedata.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());
  	}

  	private function getForm() {
    	$this->data['heading_title'] = $this->language->get('heading_title');
 
    	
        $this->data['text_select'] = $this->language->get('text_select');
		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_title_en'] = $this->language->get('entry_title_en');
		$this->data['entry_pcode'] = $this->language->get('entry_pcode');
		$this->data['entry_quantity'] = $this->language->get('entry_quantity');
		$this->data['entry_order_num'] = $this->language->get('entry_order_num');
		$this->data['entry_titlelink'] = $this->language->get('entry_titlelink');
		$this->data['entry_summary'] = $this->language->get('entry_summary');
		$this->data['entry_summary_en'] = $this->language->get('entry_summary_en');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_price_origin'] = $this->language->get('entry_price_origin');
		$this->data['entry_price_now'] = $this->language->get('entry_price_now');
		$this->data['entry_unpublished'] = $this->language->get('entry_unpublished');
		$this->data['entry_subpcode'] = $this->language->get('entry_subpcode');
		$this->data['entry_isshow'] = $this->language->get('entry_isshow');
		$this->data['entry_contact'] = $this->language->get('entry_contact');
		
				
    	$this->data['button_save'] = $this->language->get('button_save');
    	$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_attribute'] = $this->language->get('button_add_attribute');
		$this->data['button_add_image'] = $this->language->get('button_add_image');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
    	$this->data['tab_general'] = $this->language->get('tab_general');
		 
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = array();
		}

 		if (isset($this->error['meta_description'])) {
			$this->data['error_meta_description'] = $this->error['meta_description'];
		} else {
			$this->data['error_meta_description'] = array();
		}		
   
   		

		$url = '';

		
								
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('homemanager/pagedata', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
			
		if(isset($this->request->get['layout'])){
			$layout = $this->request->get['layout'];
		} else {
			$layout = 'homepage';
		}
		
		if (!isset($this->request->get['pagedata_id'])) {
			$this->data['action'] = $this->url->link('homemanager/pagedata/insert', 'layout='.$layout.'&token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('homemanager/pagedata/update', 'layout='.$layout.'&token=' . $this->session->data['token'] . '&pagedata_id=' . $this->request->get['pagedata_id'] . $url, 'SSL');
		}
		$this->data['cancel'] = $this->url->link('homemanager/pagedata', 'layout='.$layout.'&token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->get['pagedata_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$product_info = $this->model_homemanager_pagedata->getPagedata($this->request->get['pagedata_id']);
    	}
        
		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (isset($product_info)) {
			$this->data['image'] = $product_info['image'];
		} else {
			$this->data['image'] = '';
		}
		
		$this->load->model('tool/image');
		
		if (isset($product_info) && $product_info['image'] && file_exists(DIR_IMAGE . $product_info['image'])) {
			$this->data['preview'] = $this->model_tool_image->resize($product_info['image'], 100, 100);
		} else {
			$this->data['preview'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		$this->data['pagedatas'] = isset($product_info)?$product_info:array();
				
		$this->load->model('homemanager/homelayout');
		$this->data['pcode'] = $this->model_homemanager_homelayout->getHomelayouts();
		
		$this->template = 'homemanager/pagedata_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());
  	} 
	
  	private function validateForm() { 
    	if (!$this->user->hasPermission('modify', 'homemanager/pagedata')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
					
    	if (!$this->error) {
			return true;
    	} else {
      		return false;
    	}
  	}
	
  	private function validateDelete() {
    	if (!$this->user->hasPermission('modify', 'homemanager/pagedata')) {
      		$this->error['warning'] = $this->language->get('error_permission');  
    	}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}
  	
  	
	
	public function option() {
		$output = ''; 
		
		$this->load->model('catalog/option');
		
		$results = $this->model_catalog_option->getOptionValues($this->request->get['option_id']);
		
		foreach ($results as $result) {
			$output .= '<option value="' . $result['option_value_id'] . '"';

			if (isset($this->request->get['option_value_id']) && ($this->request->get['option_value_id'] == $result['option_value_id'])) {
				$output .= ' selected="selected"';
			}

			$output .= '>' . $result['name'] . '</option>';
		}

		$this->response->setOutput($output);
	}
		
	public function autocomplete() {
		$json = array();
		
		if (isset($this->request->post['filter_name'])) {
			$this->load->model('catalog/product');
			
			$data = array(
				'filter_name' => $this->request->post['filter_name'],
				'start'       => 0,
				'limit'       => 20
			);
			
			$results = $this->model_catalog_product->getProducts($data);
			
			foreach ($results as $result) {
				$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'),	
					'model'      => $result['model'],
					'price'      => $result['price']				
				);	
			}
		}
		
		$this->load->library('json');

		$this->response->setOutput(Json::encode($json));
	}
}
?>