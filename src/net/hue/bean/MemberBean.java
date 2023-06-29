package net.hue.bean;

public class MemberBean {

	int no; // 식별자
	String id; // 아이디
	String password; // 패스워드
	String name; // 이름
	String zip; // 우편번호
	String addr1; // 주소
	String addr2; // 상세주소
	String mobile1; // 핸드폰 앞
	String mobile2; // 핸드폰 중
	String mobile3; // 핸드폰 뒤
	String email; //이메일
	String gender; // 성별
	int state; // 회원여부
	String memdate;
	String deldate;

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getMobile1() {
		return mobile1;
	}
	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
	public String getMobile3() {
		return mobile3;
	}
	public void setMobile3(String mobile3) {
		this.mobile3 = mobile3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getMemdate() {
		return memdate;
	}
	public void setMemdate(String memdate) {
		this.memdate = memdate.substring(0,10);
	}
	public String getDeldate() {
		return deldate;
	}
	public void setDeldate(String deldate) {
		if(deldate != null) {
			this.deldate = deldate.substring(0,10);
		}
	}
}