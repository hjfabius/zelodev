// Exception.cc
#include <stdexcept>
#define BUF_SIZE 500

Exception::Exception(int a_intExceptionNumber, string a_strMessage) 
{
	m_strMessage = a_strMessage;
	m_intExceptionNumber = a_intExceptionNumber;
}
			
Exception::Exception(int a_intExceptionNumber, string a_strMessage, int a_intParameter)
{
	char strBuffer[BUF_SIZE];
	snprintf(strBuffer, BUF_SIZE, a_strMessage.c_str(), a_intParameter);

	m_strMessage = strBuffer;
	m_intExceptionNumber = a_intExceptionNumber;

}

Exception::Exception(int a_intExceptionNumber, string a_strMessage, string a_strParameter)
{
	char strBuffer[BUF_SIZE];
	snprintf(strBuffer, BUF_SIZE, a_strMessage.c_str(), a_strParameter.c_str());

	m_strMessage = strBuffer;
	m_intExceptionNumber = a_intExceptionNumber;

}

Exception::Exception(int a_intExceptionNumber, string a_strMessage, const char * a_strParameter)
{
	char strBuffer[BUF_SIZE];
	snprintf(strBuffer, BUF_SIZE, a_strMessage.c_str(), a_strParameter);

	m_strMessage = strBuffer;
	m_intExceptionNumber = a_intExceptionNumber;

}


const char* Exception::what() const throw(){

	char strBuffer[BUF_SIZE];

	snprintf(strBuffer, BUF_SIZE, "%d", m_intExceptionNumber);
	
	string strTmp;
	strTmp = strBuffer; 
	strTmp += " - "; 
	strTmp += m_strMessage;
	return strTmp.c_str() ;
}

Exception::~Exception() throw()
{
}
