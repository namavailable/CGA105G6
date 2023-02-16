package com.supplier.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.supplier.model.SupplierService;
import com.supplier.model.SupplierVO;


@WebServlet("/supplier.do")
public class SupplierServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOne_For_Display".equals(action)) { // ����select_page.jsp��������

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***************************1.�����������姜瞏 - ���J��都撘�������劑����歇**********************/
				String str = req.getParameter("supplyNo");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("隢撓�撱�楊���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/supplier/select_page.jsp");
					failureView.forward(req, res);
					return;//��溯��������酉
				}
				
				Integer supplyNo = null;
				try {
					supplyNo = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("撱�楊��撘�迤蝣�");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/supplier/select_page.jsp");
					failureView.forward(req, res);
					return;//��溯��������酉
				}
				
				/***************************2.��蔆����������蕭*****************************************/
				SupplierService supplierSvc = new SupplierService();
				SupplierVO supplierVO = supplierSvc.getOneSupplier(supplyNo);
				if (supplierVO == null) {
					errorMsgs.add("��鞈��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/supplier/select_page.jsp");
					failureView.forward(req, res);
					return;//��溯��������酉
				}
				
				/***************************3.���������,���������蕭(Send the Success view)*************/
				req.setAttribute("supplierVO", supplierVO); // ����w�����Ⅳ���supplierVO������,��楊���eq
				String url = "/back-end/supplier/listOneSupplier.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �����������蕭 listOneSupplier.jsp
				successView.forward(req, res);
		}
		
		
		if ("getOne_For_Update".equals(action)) { // ����listAllSupplier.jsp��������

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.�����������姜瞏****************************************/
				Integer supplyNo = Integer.valueOf(req.getParameter("supplyNo"));
				
				/***************************2.��蔆����������蕭****************************************/
				SupplierService supplierSvc = new SupplierService();
				SupplierVO supplierVO = supplierSvc.getOneSupplier(supplyNo);
								
				/***************************3.���������,���������蕭(Send the Success view)************/
				req.setAttribute("supplierVO", supplierVO);         // ����w�����Ⅳ���supplierVO������,��楊���eq
				String url = "/back-end/supplier/update_supplier_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �����������蕭 update_supplier_input.jsp
				successView.forward(req, res);
		}
		
		
		if ("update".equals(action)) { // ����update_supplier_input.jsp��������
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
				/***************************1.�����������姜瞏 - ���J��都撘�������劑����歇**********************/
				Integer supplyNo = Integer.valueOf(req.getParameter("supplyNo").trim());
				
				String supplyName = req.getParameter("supplyName");
				String supplyNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (supplyName == null || supplyName.trim().length() == 0) {
					errorMsgs.add("撱��迂: 隢蝛箇");
				} else if(!supplyName.trim().matches(supplyNameReg)) { //������毀��������(����)������蕭(regular-expression)
					errorMsgs.add("");
	            }
				
				String supplyContact = req.getParameter("supplyContact").trim();
				if (supplyContact == null || supplyContact.trim().length() == 0) {
					errorMsgs.add("撱�蝯∩犖隢蝛箇");
				}	
				
				String supplyPhone = req.getParameter("supplyPhone");
				String supplyPhoneReg = "^[0-9]*$";
				if (supplyPhone == null || supplyPhone.trim().length() == 0) {
					errorMsgs.add("撱�閰�: 隢蝛箇");
				} else if(!supplyPhone.trim().matches(supplyPhoneReg)) { //������毀��������(����)������蕭(regular-expression)
					errorMsgs.add("撱�閰�:���0-9��摮�");
	            }


				String supplyAddress = req.getParameter("supplyAddress");
				String supplyAddressReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]$";
				if (supplyAddress == null || supplyAddress.trim().length() == 0) {
					errorMsgs.add("撱���: ���銝准������摮� ");
				} 


				SupplierVO supplierVO = new SupplierVO();
				supplierVO.setSupplyNo(supplyNo);
				supplierVO.setSupplyName(supplyName);
				supplierVO.setSupplyContact(supplyContact);
				supplierVO.setSupplyPhone(supplyPhone);
				supplierVO.setSupplyAddress(supplyAddress);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("supplierVO", supplierVO); // ��楠������J��都撘����劑���supplierVO������,��里��楊���eq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/supplier/update_supplier_input.jsp");
					failureView.forward(req, res);
					return; //��溯��������酉
				}
				
				/***************************2.��蔆���������*****************************************/
				SupplierService supplierSvc = new SupplierService();
				supplierVO = supplierSvc.updateSupplier(supplyNo, supplyName, supplyContact, supplyPhone, supplyAddress);
				
				/***************************3.���摰��,���������蕭(Send the Success view)*************/
				req.setAttribute("supplierVO", supplierVO); // ����wupdate���������,�����Ⅱ������supplierVO������,��楊���eq
				String url = "/back-end/supplier/listOneSupplier.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ����������,������stOneSupplier.jsp
				successView.forward(req, res);
		}

        	if ("insert".equals(action)) { // ����addSupplier.jsp��������  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***********************1.�����������姜瞏 - ���J��都撘�������劑����歇*************************/
		
			String supplyName = req.getParameter("supplyName");
			String supplyNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (supplyName == null || supplyName.trim().length() == 0) {
				errorMsgs.add("撱��迂: 隢蝛箇");
			} else if(!supplyName.trim().matches(supplyNameReg)) { //������毀��������(����)������蕭(regular-expression)
				errorMsgs.add("");
            }
			
			String supplyContact = req.getParameter("supplyContact").trim();
			if (supplyContact == null || supplyContact.trim().length() == 0) {
				errorMsgs.add("撱�蝯∩犖隢蝛箇");
			}	
			
			String supplyPhone = req.getParameter("supplyPhone");
			String supplyPhoneReg = "^[0-9]*$";
			if (supplyPhone == null || supplyPhone.trim().length() == 0) {
				errorMsgs.add("撱�閰�: 隢蝛箇");
			} else if(!supplyPhone.trim().matches(supplyPhoneReg)) { //������毀��������(����)������蕭(regular-expression)
				errorMsgs.add("撱�閰�:���0-9��摮�");
            }


			String supplyAddress = req.getParameter("supplyAddress");
			String supplyAddressReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]$";
			if (supplyAddress == null || supplyAddress.trim().length() == 0) {
				errorMsgs.add("撱���: ���銝准������摮� ");
			} 


			SupplierVO supplierVO = new SupplierVO();
			supplierVO.setSupplyName(supplyName);
			supplierVO.setSupplyContact(supplyContact);
			supplierVO.setSupplyPhone(supplyPhone);
			supplierVO.setSupplyAddress(supplyAddress);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("supplierVO", supplierVO); // ��楠������J��都撘����劑���empVO������,��里��楊���eq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/supplier/addSupplier.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.��蔆����楊�������蕭***************************************/
				SupplierService SupplierSvc = new SupplierService();
				supplierVO = SupplierSvc.addSupplier(supplyName, supplyContact, supplyPhone, supplyAddress);
				
				/***************************3.��楊��������,���������蕭(Send the Success view)***********/
				String url = "/back-end/supplier/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ��楊�����������������stAllEmp.jsp
				successView.forward(req, res);				
		}
		
		
		if ("delete".equals(action)) { // ����listAllSupplier.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
				/***************************1.�����������姜瞏***************************************/
				Integer supplyNo = Integer.valueOf(req.getParameter("supplyNo"));
				
				/***************************2.��蔆������������蕭***************************************/
				SupplierService SupplierSvc = new SupplierService();
				SupplierSvc.deleteSupplier(supplyNo);
				
				/***************************3.�����������,���������蕭(Send the Success view)***********/								
				String url = "/back-end/supplier/listAllSupplier.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ��������������,�����邢��捎��Ⅳ�������������������
				successView.forward(req, res);
		}
	}
}
