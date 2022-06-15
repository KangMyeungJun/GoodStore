package kr.co.goodstore.service.purchase;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.stereotype.Service;

import kr.co.goodstore.dao.purchase.OrderListDAO;
import kr.co.goodstore.domain.purchase.ItemDomain;
import kr.co.goodstore.domain.purchase.OrderListDomain;
import kr.co.goodstore.vo.purchase.RefundVO;
import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class OrderListService {

	private final OrderListDAO oDAO;
	
	

	public int searchAllOrderIDs(int member_id){
		List<Integer> list=null;
		int cnt=0;
		try {
			list=oDAO.selectOrderID(member_id);
			cnt=list.size();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
	}//union
	

	
	//public LinkedHashMap<Integer, List<OrderListDomain>> searchOrderID(int member_id,Map<String, Integer> searchParam){
	public String searchOrderID(int member_id, Map<String, Integer> searchParam){
		
		String json = null;
		List<Integer> idList=null;
		List<OrderListDomain> listDomain= null;
		LinkedHashMap<Integer, List<OrderListDomain>> map=new LinkedHashMap<Integer, List<OrderListDomain>>();
		
		
		JSONObject jsonData=new JSONObject();
		JSONArray jsonArr=new JSONArray();
		JSONObject jsonTemp=null;
		//JSONArray index=null;
		//JSONArray jsonArrSmall=null;
		//JSONObject jsonTempSmall=null;
		int start=searchParam.get("startIndex")-1; //
		int end=searchParam.get("endIndex");//
		
	    
		
		try {
			//order_id list
			idList=oDAO.selectOrderID(member_id); 
			System.out.println(idList);
			System.out.println(idList.size());
			
			
			if(end>idList.size() && 0!=idList.size()) {
				
				for(int i=start; i<idList.size();i++) {
					//jsonArrSmall=new JSONArray();//array
					//jsonTempSmall=new JSONObject();//object
					listDomain=oDAO.selectOrderDetails(idList.get(i)); 

					
					for(int j=0; j<listDomain.size();j++){ 
						if(listDomain.get(j).getStatus()==null) {
							listDomain.get(j).setStatus("배송완료");
						}else if(listDomain.get(j).getStatus().equals("C")) {
							listDomain.get(j).setStatus("구매확정");
						}else {
							listDomain.get(j).setStatus("반품");
						}
					}//end for
				
					
					
					if(listDomain!=null) {
//						System.out.println("=-----------------------map-------------");
						//map.put(idList.get(i),listDomain);
//						System.out.println("=-----------------------map-------------");
						
						for(int k=0;k<listDomain.size();k++) {
							jsonTemp=new JSONObject(); 
							//index=new JSONArray();
							jsonTemp.put("detail_id",listDomain.get(k).getDetail_id()); 
							jsonTemp.put("item_id",listDomain.get(k).getItem_id()); 
							jsonTemp.put("order_id",listDomain.get(k).getOrder_id()); 
							jsonTemp.put("price",listDomain.get(k).getPrice()); 
							jsonTemp.put("amount",listDomain.get(k).getAmount()); 
							jsonTemp.put("detail_id",listDomain.get(k).getDetail_id()); 
							jsonTemp.put("image",listDomain.get(k).getImage()); 
							jsonTemp.put("item_name",listDomain.get(k).getItem_name()); 
							jsonTemp.put("status",listDomain.get(k).getStatus()); 
							jsonTemp.put("order_date",listDomain.get(k).getOrder_date()); 
							
							jsonArr.add(jsonTemp);
						}
						//System.out.println("dddd"+convertMapToJson(map));
						//Map<String, Object> map2 =map;
						//System.out.println(convertMapToJson(map2));
						//jsonTempSmall.put(idList.get(i), jsonArrSmall);
						//jsonArr.add(jsonTempSmall);
						System.out.println(jsonArr);
						jsonData.put("data",jsonArr);
						jsonData.put("flag",1);
						//System.out.println(map2);
						
							//System.out.println(json);
					}//end if
					
					//map.put(idList.get(i),listDomain);
				}//for
				jsonData.put("data",jsonArr);
			}else if(end<=idList.size() && 0!=idList.size()){
				
				
				for(int i=start; i<end;i++) { 
					listDomain=oDAO.selectOrderDetails(idList.get(i));
//					System.out.println(listDomain);
//					System.out.println("---------------------------------");
//					System.out.println("---------------------------------");
					
					for(int j=0; j<listDomain.size();j++){
						if(listDomain.get(j).getStatus()==null) {
							listDomain.get(j).setStatus("배송완료");
						}else if(listDomain.get(j).getStatus().equals("C")) {
							listDomain.get(j).setStatus("구매확정");
						}else {
							listDomain.get(j).setStatus("반품");
						}
					}//end for
					
					if(listDomain!=null) {
//						System.out.println("=-----------------------map-------------");
//						//map.put(idList.get(i).toString(),listDomain);
//						System.out.println("=-----------------------map-------------");
//						System.out.println("=-----------------------map-------------");
//						System.out.println("=-----------------------map-------------");
						for(int k=0;k<listDomain.size();k++) {
							jsonTemp=new JSONObject();
							
							jsonTemp.put("detail_id",listDomain.get(k).getDetail_id()); 
							jsonTemp.put("item_id",listDomain.get(k).getItem_id()); 
							jsonTemp.put("order_id",listDomain.get(k).getOrder_id()); 
							jsonTemp.put("price",listDomain.get(k).getPrice()); 
							jsonTemp.put("amount",listDomain.get(k).getAmount()); 
							jsonTemp.put("detail_id",listDomain.get(k).getDetail_id()); 
							jsonTemp.put("image",listDomain.get(k).getImage()); 
							jsonTemp.put("item_name",listDomain.get(k).getItem_name()); 
							jsonTemp.put("status",listDomain.get(k).getStatus()); 
							jsonTemp.put("order_date",listDomain.get(k).getOrder_date()); 
							
							jsonArr.add(jsonTemp);
						}
						//Map<String, Object> map2 =map;
						//System.out.println(map2);
						//System.out.println("****************222222222222");
						
						jsonData.put("data",jsonArr);
//						System.out.println(jsonData);
						jsonData.put("flag",1);
					}//end if
				
				}//end for
			
			}else{
				jsonData.put("flag",0);
				//end else
			}
			
		}catch(PersistenceException pe) {
			
			pe.printStackTrace();
		}
		json=jsonData.toJSONString();
		//System.out.println("*******************");
		//System.out.println(map);
		//System.out.println("*******************");
		
		return json;
	}//searchOrderID
	
	
	
	
	public String searchOrderDetailsById(int order_id){
		String json;
		
		List<OrderListDomain> list=null;
		
		JSONObject jsonData=new JSONObject();
		JSONArray jsonArr=new JSONArray();
		JSONObject jsonTemp=null;
		try {
			list=oDAO.selectOrderDetails(order_id);
			
			
			if(list!=null) {
				for(int i=0;i<list.size();i++) {
					jsonTemp=new JSONObject();
					
					jsonTemp.put("detail_id",list.get(i).getDetail_id()); 
					jsonTemp.put("item_id",list.get(i).getItem_id()); 
					jsonTemp.put("order_id",list.get(i).getOrder_id()); 
					jsonTemp.put("price",list.get(i).getPrice()); 
					jsonTemp.put("amount",list.get(i).getAmount()); 
					jsonTemp.put("detail_id",list.get(i).getDetail_id()); 
					jsonTemp.put("image",list.get(i).getImage()); 
					jsonTemp.put("item_name",list.get(i).getItem_name()); 
					jsonTemp.put("status",list.get(i).getStatus()); 
					jsonTemp.put("order_date",list.get(i).getOrder_date()); 
					
					jsonArr.add(jsonTemp);
				}
				jsonData.put("data",jsonArr);
				jsonData.put("flag",1);
			}else{
				jsonData.put("flag",0);
			}
			
		
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		json=jsonData.toJSONString();
		
		return json;
	}//
	
	
	
	
	public String searchOrderDetailsById2(int order_id){
		String json;
		
		List<OrderListDomain> list=null;
		
		JSONObject jsonData=new JSONObject();
		JSONArray jsonArr=new JSONArray();
		JSONObject jsonTemp=null;
		try {
			list=oDAO.selectOrderDetails2(order_id);
			
			
			if(list!=null) {
				for(int i=0;i<list.size();i++) {
					jsonTemp=new JSONObject();
					
					jsonTemp.put("detail_id",list.get(i).getDetail_id()); 
					jsonTemp.put("item_id",list.get(i).getItem_id()); 
					jsonTemp.put("order_id",list.get(i).getOrder_id()); 
					jsonTemp.put("price",list.get(i).getPrice()); 
					jsonTemp.put("amount",list.get(i).getAmount()); 
					jsonTemp.put("detail_id",list.get(i).getDetail_id()); 
					jsonTemp.put("image",list.get(i).getImage()); 
					jsonTemp.put("item_name",list.get(i).getItem_name()); 
					jsonTemp.put("status",list.get(i).getStatus()); 
					jsonTemp.put("order_date",list.get(i).getOrder_date()); 
					
					jsonArr.add(jsonTemp);
				}
				jsonData.put("data",jsonArr);
				jsonData.put("flag",1);
			}else{
				jsonData.put("flag",0);
			}
			
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		json=jsonData.toJSONString();
		
		return json;
	}//
	
	
	

	public String modifyOrderDetailStatus(List<Integer> valueArr){
		
		String json;
		
		int cnt=0;
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		if(valueArr!=null) {
			map.put("listProduct",valueArr);
		}
		//System.out.println(map);
//		System.out.println(map);
//		System.out.println("****************************");
//		System.out.println("****************************");
//		System.out.println("****************************");
		
		try {
			cnt=oDAO.updateOrderDetailstatus(map);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		JSONObject jsonData=new JSONObject();
		if(cnt!=0) {
			jsonData.put("success",1);
		}
		json=jsonData.toJSONString();
		
		
		return json;
	}//
	
	
	
	
	public String searchForRefund(List<Integer> valueArr){
		
		String json;

		JSONObject jsonData=new JSONObject();
		JSONArray jsonArr=new JSONArray();
		JSONObject jsonTemp=null;
		
		List<OrderListDomain> list=null;
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		if(valueArr!=null) {
			map.put("listProduct",valueArr);
		}
		//System.out.println(map);
//		System.out.println(map);
//		System.out.println("******vvvvvvvvvvvv**********************");
//		System.out.println("****vvvvvvvv*********vvv***************");
//		System.out.println("**vvvvvv**************************");
		
		try {
			list=oDAO.selectOrderDetailsForRefund(map);
			
			if(list!=null) {
				for(int i=0;i<list.size();i++) {
					jsonTemp=new JSONObject();
					
					jsonTemp.put("detail_id",list.get(i).getDetail_id()); 
					jsonTemp.put("item_id",list.get(i).getItem_id()); 
					jsonTemp.put("order_id",list.get(i).getOrder_id()); 
					jsonTemp.put("price",list.get(i).getPrice()); 
					jsonTemp.put("amount",list.get(i).getAmount()); 
					jsonTemp.put("detail_id",list.get(i).getDetail_id()); 
					jsonTemp.put("image",list.get(i).getImage()); 
					jsonTemp.put("item_name",list.get(i).getItem_name()); 
					jsonTemp.put("status",list.get(i).getStatus()); 
					jsonTemp.put("order_date",list.get(i).getOrder_date()); 
					
					jsonArr.add(jsonTemp);
				}
				jsonData.put("data",jsonArr);
				jsonData.put("flag",1);
			}else{
				jsonData.put("flag",0);
			}
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		json=jsonData.toJSONString();
		
		
		return json;
	}//
	
	
	
	
	public String modifyRefundStatus(List<Integer> valueArr,int selectIndex){
		
		String json;
		RefundVO rVO=new RefundVO();
		
		int cnt=0;
		
		//Map<String, Object> map=new HashMap<String, Object>();
		
//		if(valueArr!=null) {
//			//map.put("listProduct",valueArr);
//		}
		
		String reason="";
		switch (selectIndex) {
		case 1:reason="구매 의사 취소"; break;
		case 2:reason="색상 및 사이즈 변경"; break;
		case 3:reason="상품 잘못 주문"; break;
		case 4:reason="서비스 불만족"; break;
		case 5:reason="상품파손"; break;
		}

		
		//map.put("reason",reason);
		rVO.setReason(reason);
		
		try {
			if(valueArr!=null) {
				for(int i=0; i<valueArr.size();i++) {
					System.out.println();
					rVO.setDetail_id(valueArr.get(i));
					cnt+=oDAO.updateRefundStatus(rVO);
				}//end for
			}
			//cnt=oDAO.updateRefundStatus(map);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		JSONObject jsonData=new JSONObject();
		if(cnt!=0) {
			jsonData.put("success",1);
		}
		json=jsonData.toJSONString();
		
		
		return json;
	}//
	
	
	
	
}//class
