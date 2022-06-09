package kr.co.goodstore.domain.admin;

public class MemberDomain {
	
	
	private int member_id, zipcode;
	private String email, join_date, name, tel, address, ip;
	
	
	
	public int getMember_id() {
		return member_id;
	}



	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}



	public int getZipcode() {
		return zipcode;
	}



	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getJoin_date() {
		return join_date;
	}



	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getIp() {
		return ip;
	}



	public void setIp(String ip) {
		this.ip = ip;
	}



	@Override
	public String toString() {
		return "MemberDomain [member_id=" + member_id + ", zipcode=" + zipcode + ", email=" + email + ", join_date="
				+ join_date + ", name=" + name + ", tel=" + tel + ", address=" + address + ", ip=" + ip + "]";
	}
	
	
	

}
