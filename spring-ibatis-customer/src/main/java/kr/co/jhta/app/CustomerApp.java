package kr.co.jhta.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.co.jhta.dao.CustomerDao;
import kr.co.jhta.vo.Customer;

public class CustomerApp {

	public static void main(String[] args) {
		String resource = "classpath:/META-INF/spring/context.xml";
		ApplicationContext ctx = new ClassPathXmlApplicationContext(resource);

		CustomerDao customerDao = ctx.getBean(CustomerDao.class);
		Scanner scanner = new Scanner(System.in);
		
		while (true) {
			System.out.println("\n");
			System.out.println("------------------------------------------------------");
			System.out.println("1.전체조회 2.고객검색 3.등록 4.키워드검색 5.수정 6.삭제 0.종료");
			System.out.println("------------------------------------------------------");
			
			System.out.print("메뉴선택> ");
			int menu = scanner.nextInt();
			
			if (menu == 1) {
				System.out.println("전체 고객정보 출력");
				System.out.println("---------------------------------------------------");
				List<Customer> customers = customerDao.getAllCustomers();
				for (Customer c1 : customers) {
					System.out.println("고객번호 : " + c1.getNo());
					System.out.println("고 객 명 : " + c1.getName());
					System.out.println("전화번호 : " + c1.getTel());
					System.out.println();
				}
				
			} else if (menu == 2) {
				System.out.println("상세 고객정보 출력");
				System.out.println("---------------------------------------------------");

				System.out.print("고객 번호 입력 > ");
				int custNo = scanner.nextInt();
				
				Customer customer = customerDao.getCustomerByNo(custNo);
				try {
					System.out.println("고객번호 : " + customer.getNo());
					System.out.println("고 객 명 : " + customer.getName());
					System.out.println("별    명 : " + customer.getNickName());
					System.out.println("전화번호 : " + customer.getTel());
					System.out.println("이 메 일 : " + customer.getEmail());
					System.out.println("도    시 : " + customer.getCity());
					System.out.println("포 인 트 : " + customer.getPoint());
					System.out.println("등 록 일 : " + customer.getCreateDate());
					System.out.println();
				} catch (NullPointerException e) {
					System.out.println("검색된 정보가 없습니다.");
				}
				
			} else if (menu == 3) {
				System.out.println("고객 등록");
				System.out.println("---------------------------------------------------");
				
				System.out.print("이름 입력> ");
				String name = scanner.next();
				System.out.print("별명 입력> ");
				String nickName = scanner.next();
				System.out.print("전화번호 입력> ");
				String tel = scanner.next();
				System.out.print("이메일 입력> ");
				String email = scanner.next();
				System.out.print("도시 입력> ");
				String city = scanner.next();
				
				Customer customer = new Customer();
				customer.setName(name);
				customer.setNickName(nickName);
				customer.setTel(tel);
				customer.setEmail(email);
				customer.setCity(city);
				
				customerDao.insertCustomer(customer);
				System.out.println("등록이 완료되었습니다.");
				
			} else if (menu == 4) {
				System.out.println("고객 정보 검색");
				System.out.println("---------------------------------------------------");
				
				System.out.println("검색 옵션 : 1.번호 2.이름 3.닉네임");
				System.out.print("옵션 번호 입력 > ");
				int opNo = scanner.nextInt();
				System.out.print("검색 키워드 입력 > ");
				String keyword = scanner.next();
				
				String option = null;
				if(opNo == 1) {
					option = "no";
				} else if(opNo == 2) {
					option = "name";
				} else if(opNo ==3) {
					option = "nickName";
				}
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("option", option);
				map.put("keyword", keyword);
				
				List<Customer> customers = customerDao.getCustomersBySearch(map);
				for(Customer c : customers) {
					try {
						System.out.println("고객번호 : " + c.getNo());
						System.out.println("고 객 명 : " + c.getName());
						System.out.println("별    명 : " + c.getNickName());
						System.out.println("전화번호 : " + c.getTel());
						System.out.println("이 메 일 : " + c.getEmail());
						System.out.println("도    시 : " + c.getCity());
						System.out.println("포 인 트 : " + c.getPoint());
						System.out.println("등 록 일 : " + c.getCreateDate());
						System.out.println();
					} catch (NullPointerException e) {
						System.out.println("검색된 정보가 없습니다.");
					}
				}
				
			} else if (menu == 5) {
				System.out.println("고객 정보 수정");
				System.out.println("---------------------------------------------------");
				
				System.out.print("고객 번호 입력 > ");
				int custNo = scanner.nextInt();
				System.out.print("변경할 별명 입력 > ");
				String nickName = scanner.next();
				System.out.print("변경할 전화번호 입력 > ");
				String tel = scanner.next();
				System.out.print("변경할 거주지 입력 > ");
				String city = scanner.next();
				System.out.print("변경할 이메일 입력 > ");
				String email = scanner.next();
				System.out.print("변경할 포인트 입력 > ");
				int point = scanner.nextInt();
				
				Customer customer = customerDao.getCustomerByNo(custNo);
				customer.setNickName(nickName);
				customer.setTel(tel);
				customer.setEmail(email);
				customer.setCity(city);
				customer.setPoint(point);
				
				customerDao.updateCustomer(customer);
				System.out.println("정보가 변경되었습니다.");
				
			} else if (menu == 6) {
				System.out.println("고객 정보 삭제");
				System.out.println("---------------------------------------------------");
				
				System.out.print("고객 번호 입력 > ");
				int custNo = scanner.nextInt();
				
				customerDao.deleteCustomerByNo(custNo);
				System.out.println("정보가 삭제되었습니다.");
				
			} else if (menu == 0) {
				System.out.println("프로그램을 종료합니다.");
				break;
			}
		}
	}
}
