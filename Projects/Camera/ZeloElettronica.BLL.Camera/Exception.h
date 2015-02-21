//Exception.h

//10001, "bad image depth %d"
//10002, "open %s: failed"

//20001, "cannot open framebuffer device"
//20002, "error reading fixed information"
//20003, "error reading variable information"
//20004, "failed to map framebuffer device to memory"

//30001, "cannot open pattern file"

//40001, "value's matrix is not completed"
//40002, "analysis' index out of array"
//40003, "analysis area out of bound"
//40004, "no result below threshold"
//40005, "minimum point is not unique"
//40006, "point to search is out of bounds"

//50001, "impossible to open connection to server"
//50002, "impossible to send the message to the server"
//50003, "impossible to receive a message from the server"
//50004, "wrong message from the server"
//50005, "IP not set-up on server"
//50006, "Impossible to retrieve IP configuration"
//50007  "Mark parameter's index out of bounds"
//50008  "No reference color found"

//60001, "error receiving page number from ST7"


#ifndef EXCEPTION_H
	#define EXCEPTION_H

	#include <string>

	using std::string;

	class Exception: public std::exception{
		protected:
			string	m_strMessage;	
			int		m_intExceptionNumber;

		public:
			Exception(int a_intExceptionNumber, string a_strMessage);
			Exception(int a_intExceptionNumber, string a_strMessage, int a_intParameter);
			Exception(int a_intExceptionNumber, string a_strMessage, string a_strParameter);
			Exception(int a_intExceptionNumber, string a_strMessage, const char * a_strParameter);

			~Exception() throw();

			const char* what() const throw();
	};

#endif
