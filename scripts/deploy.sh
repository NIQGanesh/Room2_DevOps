deploy:
    runs-on: ubuntu-latest
    needs: test
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
 
      - name: Update config for deployment
        run: |
          sed -i 's/enable_logs: false/enable_logs: true/' config.yaml
          sed -i 's/localhost/0.0.0.0/' config.yaml
 
      - name: Deploy application
        run: ./script/deploy