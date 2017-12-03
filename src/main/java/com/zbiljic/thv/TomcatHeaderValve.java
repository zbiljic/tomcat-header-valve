package com.zbiljic.thv;

import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.Response;
import org.apache.catalina.valves.ValveBase;

import javax.servlet.ServletException;
import java.io.IOException;

/**
 * A {@link org.apache.catalina.Valve} that injects custom response header.
 */
public class TomcatHeaderValve extends ValveBase {

  @Override
  public void invoke(Request request, Response response) throws IOException, ServletException {
    try {
      response.setHeader(
        TomcatHeaderInjector.getHeaderName(),
        TomcatHeaderInjector.getHeaderValue()
      );
    } catch (Exception e) {
      // ignore
    }
    // continue
    getNext().invoke(request, response);
  }
}
