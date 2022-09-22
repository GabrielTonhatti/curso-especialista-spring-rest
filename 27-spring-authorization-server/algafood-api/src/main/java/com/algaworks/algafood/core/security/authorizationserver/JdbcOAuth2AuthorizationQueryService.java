package com.algaworks.algafood.core.security.authorizationserver;

import org.apache.tomcat.util.http.parser.Authorization;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.oauth2.server.authorization.JdbcOAuth2AuthorizationService;
import org.springframework.security.oauth2.server.authorization.OAuth2Authorization;
import org.springframework.security.oauth2.server.authorization.client.JdbcRegisteredClientRepository;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClient;
import org.springframework.security.oauth2.server.authorization.client.RegisteredClientRepository;

import java.util.List;

public class JdbcOAuth2AuthorizationQueryService implements OAuth2AuthorizationQueryService {

    private final JdbcOperations jdbcOperations;
    private final RowMapper<RegisteredClient> registeredClientRowMapper;
    private final RowMapper<OAuth2Authorization> oAuth2AuthorizationRowMapper;

    public JdbcOAuth2AuthorizationQueryService(JdbcOperations jdbcOperations, RegisteredClientRepository repository) {
        this.jdbcOperations = jdbcOperations;
        this.registeredClientRowMapper = new JdbcRegisteredClientRepository.RegisteredClientRowMapper();
        this.oAuth2AuthorizationRowMapper = new JdbcOAuth2AuthorizationService.OAuth2AuthorizationRowMapper(repository);
    }

    @Override
    public List<RegisteredClient> listClientsWithConsent(String principalName) {
        String LIST_AUTHORIZED_CLIENTS = "SELECT rc.* " +
                "FROM oauth2_authorization_consent c" +
                "         INNER JOIN oauth2_registered_client rc ON rc.id = c.registered_client_id " +
                "WHERE c.principal_name = ? ";

        return this.jdbcOperations.query(LIST_AUTHORIZED_CLIENTS, this.registeredClientRowMapper, principalName);
    }

    @Override
    public List<OAuth2Authorization> listAuthorizations(String principalName, String clientId) {
        String LIST_AUTHORIZATIONS = "SELECT a.* " +
                "FROM oauth2_authorization a " +
                "         INNER JOIN oauth2_registered_client c ON c.id = a.registered_client_id " +
                "WHERE a.principal_name = ? " +
                "  AND a.registered_client_id = ? ";

        return this.jdbcOperations.query(LIST_AUTHORIZATIONS, this.oAuth2AuthorizationRowMapper, principalName, clientId);
    }
}
